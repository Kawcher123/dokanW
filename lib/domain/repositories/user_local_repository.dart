
import 'package:dokan/domain/entities/user_entity.dart';

abstract class UserLocalRepository {
  void saveUser(UserEntity user);
  UserEntity? getUser();
  void clearUser();
}