import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/data/data_sources/local_data_source/product_data_source.dart';
import 'package:dokan/domain/entities/product_entity.dart';
import 'package:dokan/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});


  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() async {
    try {
      final productListOrFailure = await productDataSource.getProductList();
      return productListOrFailure;
    } on CacheFailure {
      return Left(CacheFailure('Failed to fetch product list from local storage'));
    } catch (e) {
      return Left(ServerFailure('Failed to fetch product list from local storage:$e'));
    }
  }

}