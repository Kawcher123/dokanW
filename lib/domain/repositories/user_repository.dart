import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/user_entity.dart';

abstract class UserRepository {

  Future<void> signup(UserEntity user);
  Future<Either<Failure,UserEntity>> login(String email, String password);
  Future<void> updateUser(UserEntity user);

}