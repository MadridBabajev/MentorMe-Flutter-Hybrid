import 'package:mentor_me/services/mentor_me_api/models/identity/jwt_response.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/login_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/logout_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/identity/register_payload.dart';

abstract class IdentityServiceContract {
  /// Login
  Future<JWTResponse?> login(LoginPayload loginData);

  /// Register
  Future<JWTResponse?> register(RegisterPayload registerData);

  /// Logout
  Future<bool> logout(LogoutPayload logoutData);
}
