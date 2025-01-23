class AuthState {
  final bool isAuthorized;
  final String? userType;
  final String? userId;
  final String? errorMessage;

  AuthState._(
      {required this.isAuthorized,
      required this.userType,
      required this.userId,
      this.errorMessage});

  factory AuthState.unauthorized(String? errorMessage) => AuthState._(
      isAuthorized: false,
      userType: null,
      userId: null,
      errorMessage: errorMessage ?? "");

  factory AuthState.authorized(
          {required String userType, required String userId}) =>
      AuthState._(
        isAuthorized: true,
        userType: userType,
        userId: userId,
      );
}
