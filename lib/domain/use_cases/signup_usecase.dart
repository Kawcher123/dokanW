import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/repositories/user_repository.dart';

class SignupUSeCase {
  final UserRepository repository;

  SignupUSeCase({required this.repository});

  Future<Either<Failure,bool>> signup(String username,String email,String pass) async {
    return await repository.signup( username, email, pass);
  }
}