import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/jwt_payload_fields.dart';
import 'package:mentor_me/common/constants/secure_storage_keys.dart';
import 'package:mentor_me/common/constants/user_types.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/secure_storage/secure_storage_manager.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/login_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/logout_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/register_payload.dart';
import 'package:mentor_me/state/authorization/auth_state.dart';
import 'package:mentor_me/state/loading/is_loading_provider.dart';
import 'package:mentor_me/state/views/user/profile/profile_provider.dart';
import 'package:mentor_me/state/views/user/profile/profile_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  final AppLogger logger = AppLogger();

  AuthNotifier(this.ref) : super(AuthState.unauthorized(null));

  Future<void> login(String email, String password, bool isTutor) async {
    ref.read(isLoadingProvider.notifier).state = true;
    try {
      final identityService = ref.read(mentorMeApiProvider).identityService;
      final response = await identityService.login(
        LoginPayload(email: email, password: password, isTutor: isTutor),
      );
      if (response != null) {
        setAuth(response.jwt);
      } else {
        state = AuthState.unauthorized("Invalid credentials.");
      }
    } catch (e) {
      state = AuthState.unauthorized("Something went wrong.");
      logger.logError("Login error: $e");
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  Future<void> register(
    String firstname,
    String lastname,
    String email,
    String password,
    String confirmPassword,
    String mobilePhone,
    bool isTutor,
    String country,
  ) async {
    ref.read(isLoadingProvider.notifier).state = true;
    try {
      final identityService = ref.read(mentorMeApiProvider).identityService;
      final response = await identityService.register(
        RegisterPayload(
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          mobilePhone: mobilePhone,
          isTutor: isTutor,
          country: country,
        ),
      );
      if (response != null) {
        setAuth(response.jwt);
      } else {
        state = AuthState.unauthorized("Registration failed.");
      }
    } catch (e) {
      state = AuthState.unauthorized("Something went wrong.");
      logger.logError("Registration error: $e");
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  Future<void> initializeAuth() async {
    try {
      String? jwt =
          await SecureStorageManager().read(SecureStorageKeys.jwtToken);

      if (jwt != null && !JwtDecoder.isExpired(jwt)) {
        setAuth(jwt);
      } else {
        logger.logInfo("No valid JWT token found in local storage.");
        state = AuthState.unauthorized(null);
      }
    } catch (e) {
      state = AuthState.unauthorized("Failed to initialize authentication.");
      logger.logError("Initialization error: $e");
    }
  }

  Future<void> logout() async {
    try {
      final identityService = ref.read(mentorMeApiProvider).identityService;
      final refreshToken =
          await SecureStorageManager().read(SecureStorageKeys.refreshToken);
      identityService.logout(LogoutPayload(refreshToken: refreshToken ?? ""));

      // Clear the provider states
      ref.read(profileProvider.notifier).state = ProfileState.initial();
      state = AuthState.unauthorized(null);
    } catch (e) {
      logger.logError("Logout error: $e");
    }
  }

  void setAuth(String jwt) {
    try {
      // Decode the JWT
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);

      // Extract the UserType and UserId from the payload and set the state
      String userType =
          decodedToken[JwtPayloadFields.userType] ?? UserTypes.unknown;
      String userId = decodedToken[JwtPayloadFields.userId] ?? "Unknown ID";
      state = AuthState.authorized(userType: userType, userId: userId);
      logger.logInfo("The user has been successfully authorized.");
    } catch (e) {
      logger.logError("Error decoding JWT: $e");
      state = AuthState.unauthorized("Invalid JWT token.");
    }
  }
}
