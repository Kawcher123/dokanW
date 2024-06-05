import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<void> updateUserData(UserEntity user) async {
    await repository.updateUser(user);
  }
}