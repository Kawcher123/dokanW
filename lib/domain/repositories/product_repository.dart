import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();
}