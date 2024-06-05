import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/data/data_sources/remote/user_data_source.dart';
import 'package:dokan/data/models/user_model.dart';
import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, bool>> signup(String username,String email,String pass) async {
    try {
      //final userModel = UserModel.fromEntity(user);
      return await userDataSource.signup( username, email, pass);
    } on BadRequestFailure {
      return Left(BadRequestFailure('Failed to register'));
    } catch (e) {
      return Left(ServerFailure('Failed to register:$e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(String username, String password) async {
    try {
      final userModel = await userDataSource.login(username: username, password: password);
      return userModel;
    } on BadRequestFailure {
      return Left(BadRequestFailure('Failed to login'));
    } on UnauthorisedFailure {
      return Left(UnauthorisedFailure('Unauthorized'));
    } catch (e) {
      return Left(ServerFailure('Failed to login:$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(String name, String email, String nick) async {
    try {
      return await userDataSource.updateUser(name, email, nick);
    } on BadRequestFailure {
      return Left(BadRequestFailure('Failed to update'));
    } on UnauthorisedFailure {
      return Left(UnauthorisedFailure('Unauthorized'));
    } catch (e) {
      return Left(ServerFailure('Failed to update:$e'));
    }
  }
}
