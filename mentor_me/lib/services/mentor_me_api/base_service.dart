import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/common/constants/secure_storage_keys.dart';
import 'package:mentor_me/common/logger/logger_contract.dart';
import 'package:mentor_me/common/secure_storage/secure_storage_manager_contract.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/jwt_response.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/refresh_token_payload.dart';

class BaseService {
  @protected
  final Dio dio;
  @protected
  final Dio dioForRefresh;
  @protected
  final LoggerContract serviceLogger;
  @protected
  final SecureStorageManagerContract secureStorageManager;

  BaseService({
    required LoggerContract logger,
    required SecureStorageManagerContract secureStorageManager,
    required String baseUrl,
  })  : serviceLogger = logger,
        secureStorageManager = secureStorageManager,
        dio = Dio(),
        dioForRefresh = Dio() {
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Content-Type'] = 'application/json';
    dioForRefresh.options.baseUrl =
        "${RestEndpoints.hostBaseUrl}${RestEndpoints.accountController}${RestEndpoints.refreshJwtToken}";
    dioForRefresh.options.headers['Content-Type'] = 'application/json';

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token =
            await secureStorageManager.read(SecureStorageKeys.jwtToken);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          final isTokenRefreshed = await refreshJwtToken();
          if (isTokenRefreshed) {
            return handler.resolve(await retryRequest(error.requestOptions));
          }
        }
        handler.next(error);
      },
    ));
  }

  Future<bool> refreshJwtToken() async {
    final refreshToken =
        await secureStorageManager.read(SecureStorageKeys.refreshToken);
    final jwt = await secureStorageManager.read(SecureStorageKeys.jwtToken);
    if (refreshToken == null || jwt == null) return false;

    try {
      final response = await dioForRefresh.post(
        "",
        data:
            RefreshTokenPayload(jwt: jwt, refreshToken: refreshToken).toJson(),
      );

      if (response.statusCode == 200) {
        final jwtResponse = JWTResponse.fromJson(response.data);
        await storeTokens(jwtResponse);
        return true;
      }
    } catch (e) {
      serviceLogger.logError('Error refreshing token: $e');
    }
    return false;
  }

  @protected
  Future<void> storeTokens(JWTResponse jwtResponse) async {
    await secureStorageManager.write(
        SecureStorageKeys.jwtToken, jwtResponse.jwt);
    await secureStorageManager.write(
        SecureStorageKeys.refreshToken, jwtResponse.refreshToken);
    await secureStorageManager.write(
        SecureStorageKeys.expiresIn, jwtResponse.expiresIn.toString());
    serviceLogger.logInfo('Tokens stored in secure storage.');
  }

  Future<Response> retryRequest(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    serviceLogger.logInfo('Retrying request: ${requestOptions.path}');
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
