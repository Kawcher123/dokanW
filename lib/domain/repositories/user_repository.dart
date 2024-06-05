import 'package:dokan/domain/entities/user_entity.dart';

abstract class UserRepository {

  Future<void> signup(UserEntity user);
  Future<UserEntity> login(String email, String password);
  Future<void> updateUser(UserEntity user);

}