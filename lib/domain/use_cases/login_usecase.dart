import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class Login {
  final UserRepository repository;

  Login(this.repository);

  Future<UserEntity> login(String email, String password) async {
    return await repository.login(email, password);
  }
}