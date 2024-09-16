import '../../domain/domain_mapper.dart';
import '../../domain/model/login.dart';

class LoginRequest implements DomainMapper<Login> {
  String email = "";
  String password = "";
  String token = "";

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data["persistent"] = true;
    return data;
  }

  @override
  Login mapToDomain() => Login(email: email, password: password);
}

class LoginResponse {
  final String? access;
  final String? refresh;

  LoginResponse({this.access, this.refresh});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        refresh: json['refresh'] ?? "", access: json['access']);
  }
}
