class Login {
  final String email;
  final String password;

  const Login({
    required this.email,
    required this.password,
  });
}

// ignore: constant_identifier_names
enum Social { Facebook, Google, Apple }

class SocialSignIn {
  final Social social;
  final String token;
  final String? idToken;
  final String? displayName;

  const SocialSignIn(
      {required this.social,
      required this.token,
      this.idToken,
      this.displayName});

  Map<String, dynamic> toApiRequest() =>
      {'auth_token': token, 'display_name': displayName};

  Map<String, dynamic> toAppleAuthRequest() => {
        'access_token': token,
      };
}
