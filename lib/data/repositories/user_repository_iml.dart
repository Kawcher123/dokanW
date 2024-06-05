import 'package:dokan/data/data_sources/remote/user_data_source.dart';
import 'package:dokan/data/models/user_model.dart';
import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UseDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<void> signup(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await userDataSource.signup(userModel);
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await userDataSource.login(email, password);
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      token: userModel.token,
    );
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await userDataSource.updateUser(userModel);
  }
}