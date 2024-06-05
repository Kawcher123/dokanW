import 'package:dokan/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UseDataSource {
  Future<void> signup(UserModel userModel);
  Future<UserModel> login(String email, String password);
  Future<void> updateUser(UserModel userModel);
}

class UseDataSourceImpl implements UseDataSource {
  final http.Client client;

  UseDataSourceImpl({required this.client});

  @override
  Future<void> signup(UserModel userModel) async {
    final response = await client.post(
      Uri.parse('https://example.com/api/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userModel.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to signup user');
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://example.com/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }

    return UserModel.fromJson(json.decode(response.body));
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    final response = await client.post(
      Uri.parse('https://example.com/api/update'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userModel.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }
}