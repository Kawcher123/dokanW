import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/data/models/product_model.dart';
import 'package:flutter/services.dart';
abstract class ProductLocalDataSource {
  Future<Either<Failure, List<ProductModel>>> getProductList();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> getProductList() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/response.json');
      print('ProductLocalDataSourceImpl.getProductList:$jsonString');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      print('products:${jsonResponse}');
      final productList = jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
      return Right(productList);
    } catch (e) {
      return Left(CacheFailure('Failed to fetch product list from local storage:$e'));
    }
  }
}