import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_local_repository.dart';

class UserLocalUseCase {
  final UserLocalRepository repository;

  UserLocalUseCase({required this.repository});

  void saveUserDataLocally(UserEntity user) {
    print('UserLocalUseCase.saveUserDataLocally:${user.token}');
    repository.saveUser(user);
  }

  void clearUserData() {
    repository.clearUser();
  }

  UserEntity? getUserData() {
    UserEntity? userEntity = repository.getUser();

    return userEntity;
  }

}
