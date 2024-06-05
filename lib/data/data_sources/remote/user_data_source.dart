import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/data/data_sources/api_manager/api_manager.dart';
import 'package:dokan/data/data_sources/api_manager/api_url.dart';
import 'package:dokan/data/models/user_model.dart';
import 'dart:convert';

abstract class UserDataSource {
  Future<void> signup(UserModel userModel);
  Future<Either<Failure, UserModel>> login({required String username,required String password});
  Future<void> updateUser(UserModel userModel);
}

class UserDataSourceImpl implements UserDataSource {
  final APIManager apiManager;

  UserDataSourceImpl({required this.apiManager});

  @override
  Future<void> signup(UserModel userModel) async {
    final response = await apiManager.postAPICallWithHeader(
      url: ApiUrl.signup,
      param: jsonEncode(userModel.toJson()),
      headerData: {
        'Content-Type': 'application/json'
      },
    );
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
      return Left(BadRequestFailure('Failed to login'));
    }
    on UnauthorisedFailure {
      return Left(UnauthorisedFailure('Unauthorized'));
    }
    catch (e) {
      return Left(ServerFailure('Failed to login:$e'));
    }

  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    final response = await apiManager.postAPICallWithHeader(
      url: '${ApiUrl.updateUser}${userModel.id}',
      param: userModel.toJson(),
      headerData: {
        'Content-Type': 'application/json'
      },
    );
  }
}