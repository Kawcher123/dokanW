import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class Signup {
  final UserRepository repository;

  Signup(this.repository);

  Future<void> signup(UserEntity user) async {
    await repository.signup(user);
  }
}