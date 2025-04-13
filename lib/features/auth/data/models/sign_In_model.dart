class SignInRequestModel {
  final String email;
  final String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
