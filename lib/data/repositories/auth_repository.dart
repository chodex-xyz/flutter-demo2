import 'package:flutter_demo2/core/urls.dart';
import 'package:flutter_demo2/services/http_client.dart';

abstract class AuthRepository {
  Future<bool> signIn(String phone, String password);
  Future<bool> me();
}

class AuthRepositoryImpl extends AuthRepository {
  final HttpClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<bool> signIn(String phone, String password) async {
    final response = await _client.post(URLs.authSignIn, body: {"phone": phone, "password": password});
    return true;
  }

  @override
  Future<bool> me() async {
    final response = await _client.get(URLs.authMe);
    print(response);
    return true;
  }
}
