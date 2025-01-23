import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/identity_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/jwt_response.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/login_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/logout_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/register_payload.dart';

class IdentityService extends BaseService implements IdentityServiceContract {
  IdentityService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<JWTResponse?> login(LoginPayload loginData) async {
    try {
      serviceLogger.logInfo('Attempting to log in users: ${loginData.email}');
      final response = await dio.post(
        RestEndpoints.login,
        data: loginData.toJson(),
      );

      if (response.statusCode == 200) {
        final jwtResponse = JWTResponse.fromJson(response.data);
        await storeTokens(jwtResponse);
        serviceLogger.logInfo('Login successful. JWT received and stored in the secure storage.');
        return jwtResponse;
      }
    } catch (e) {
      serviceLogger.logError('Login error: $e');
    }
    return null;
  }

  @override
  Future<JWTResponse?> register(RegisterPayload registerData) async {
    try {
      serviceLogger
          .logInfo('Attempting to register users: ${registerData.email}');
      final response = await dio.post(
        RestEndpoints.register,
        data: registerData.toJson(),
      );

      if (response.statusCode == 200) {
        final jwtResponse = JWTResponse.fromJson(response.data);
        await storeTokens(jwtResponse);
        serviceLogger.logInfo('Registration successful. JWT received and stored in the secure storage.');
        return jwtResponse;
      }
    } catch (e) {
      serviceLogger.logError('Registration error: $e');
    }
    return null;
  }

  @override
  Future<bool> logout(LogoutPayload logoutData) async {
    try {
      serviceLogger.logInfo('Attempting to log out users.');
      final response = await dio.post(
        RestEndpoints.logout,
        data: logoutData.toJson(),
      );

      if (response.statusCode == 200) {
        await secureStorageManager.clear();
        serviceLogger.logInfo('Logout successful and secure storage cleared.');
        return true;
      }
    } catch (e) {
      serviceLogger.logError('Logout error: $e');
    }
    return false;
  }
}
