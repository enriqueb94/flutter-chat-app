import 'dart:convert';
import 'package:chat/environments/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  late bool _autenticando = false;

  // getters y setters
  bool get autenticando => _autenticando;

  final _storage = const FlutterSecureStorage();

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  static Future getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;
    // debugPrint(autenticando.toString());
    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse(Environment.apiUrl + '/login'),
        body: jsonEncode(data), headers: {'Content-type': 'application/json'});
    autenticando = false;
    // ignore: avoid_print
    debugPrint(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

  Future register(String nombre, String email, String password) async {
    autenticando = true;
    // debugPrint(autenticando.toString());
    final data = {'email': email, 'nombre': nombre, 'password': password};

    final resp = await http.post(Uri.parse(Environment.apiUrl + '/login/new'),
        body: jsonEncode(data), headers: {'Content-type': 'application/json'});
    autenticando = false;
    // ignore: avoid_print
    debugPrint(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    final resp = await http.get(Uri.parse(Environment.apiUrl + '/login/renew'),
        headers: {'Content-type': 'application/json', 'x-token': '$token'});
    autenticando = false;
    // ignore: avoid_print
    debugPrint(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      logout();
      return false;
    }
  }
}
