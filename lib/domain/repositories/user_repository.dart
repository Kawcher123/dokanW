import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/user_entity.dart';

abstract class UserRepository {

  Future<Either<Failure,bool>> signup(String username,String email,String pass);
  Future<Either<Failure,UserEntity>> login(String email, String password);
  Future<Either<Failure,bool>> updateUser(String name,String email,String nick);

}