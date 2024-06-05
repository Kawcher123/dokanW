
import 'package:dartz/dartz.dart';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/product_entity.dart';
import 'package:dokan/domain/repositories/product_repository.dart';

class ProductsUseCase {
  final ProductRepository repository;

  ProductsUseCase(this.repository);

  Future<Either<Failure,List<ProductEntity>>> getProducts() async {
    return await repository.getProductList();
  }
}