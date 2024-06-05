import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/data/data_sources/api_manager/api_manager.dart';
import 'package:dokan/data/data_sources/api_manager/api_url.dart';
import 'package:dokan/data/models/user_model.dart';
import 'dart:convert';

import 'package:dokan/domain/repositories/user_local_repository.dart';

abstract class UserDataSource {
  Future<Either<Failure,bool>>  signup(String username,String email,String pass);
  Future<Either<Failure, UserModel>> login({required String username,required String password});
  Future<Either<Failure,bool>> updateUser(String name,String email,String nick);
}

class UserDataSourceImpl implements UserDataSource {
  final APIManager apiManager;
  final UserLocalRepository userLocalRepository;

  UserDataSourceImpl({required this.apiManager,required this.userLocalRepository});

  @override
   Future<Either<Failure,bool>>  signup(String username,String email,String pass) async {
    try {
      final response = await apiManager.postAPICallWithHeader(
        url: ApiUrl.signup,
        param: jsonEncode(
            {
              "username": username,
              "email": email,
              "password": pass
            }
        ),
        headerData: {
          'Content-Type': 'application/json'
        },
      );

      if(response['code']==200)
        {
          return const Right(true);
        }
      else
        {
          return const Right(false);
        }
    }     on BadRequestFailure {
      return Left(BadRequestFailure('Failed to update'));
    }

    catch (e) {
      return Left(ServerFailure('Failed to update:$e'));
    }
  }

  @override
  Future<Either<Failure,UserModel>> login({required String username,required String password}) async {

    try {
      final response = await apiManager.postAPICallWithHeader(
        url: ApiUrl.login,
        param: jsonEncode({
          "username":username,
          "password":password,
        }),
        headerData: {
          'Content-Type': 'application/json'
        },
      );
      return Right(UserModel.fromJson(response));
    }
    on BadRequestFailure {
      return Left(BadRequestFailure('Failed to update'));
    }
    on UnauthorisedFailure {
      return Left(UnauthorisedFailure('Unauthorized'));
    }
    catch (e) {
      return Left(ServerFailure('Failed to update:$e'));
    }

  }

  @override
  Future<Either<Failure,bool>> updateUser(String name,String email,String nick) async {
    try {
      final String? token=userLocalRepository.getUser()?.token;
      final String? id=userLocalRepository.getUser()?.id;
      final response = await apiManager.postAPICallWithHeader(
        url: '${ApiUrl.updateUser}$id',
        param: jsonEncode(
            {
              "name": name,
              "email": email,
              "nickname": nick
            }
          ),
        headerData: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print('UserDataSourceImpl.updateUser:${response}');
      if(response.containsKey('id')){
        return const Right(true);
      }
      else
        {
          return const Right(false);
        }
    }   on BadRequestFailure {
      return Left(BadRequestFailure('Failed to login'));
    }
    on UnauthorisedFailure {
      return Left(UnauthorisedFailure('Unauthorized'));
    }
    catch (e) {
      return Left(ServerFailure('Failed to login:$e'));
    }
  }
}