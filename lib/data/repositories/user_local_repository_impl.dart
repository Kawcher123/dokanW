

import 'package:dokan/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:dokan/data/models/user_model.dart';
import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_local_repository.dart';

class UserLocalRepositoryImpl implements UserLocalRepository
{
  final UserLocalDataSource userLocalDataSource;
  UserLocalRepositoryImpl({required this.userLocalDataSource});
  @override
  void clearUser() {
   userLocalDataSource.clearUser();
  }

  @override
  UserEntity? getUser() {

    return userLocalDataSource.getUser();
  }

  @override
  void saveUser(UserEntity user) {
    print('UserLocalRepositoryImpl.saveUser:${user.token}');
    print('UserLocalRepositoryImpl.saveUser:${user.id}');
    userLocalDataSource.saveUser(UserModel.fromEntity(user));
  }
  
}