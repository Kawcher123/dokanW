import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/product_entity.dart';
import 'package:dokan/domain/use_cases/products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final ProductsUseCase _productsUseCase;

  HomeController(this._productsUseCase);

  final productList=<ProductEntity>[].obs;
  final productsLoaded=false.obs;
  RxMap<String, bool> filterOptions = {
    'Newest': false,
    'Oldest': false,
    'Price Low>High': false,
    'Price High>Low': false,
    'Best Selling': false,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void fetchProducts() async {
    final result = await _productsUseCase.getProducts();
    result.fold(
          (failure) {
        // Handle error
        if (failure is CacheFailure) {
          print('Cache Error: ${failure.message}');
        } else if (failure is ServerFailure) {
          print('Server Error: ${failure.message}');
        } else {
          print('Unknown Error');
        }
      },
          (products) {
       productList.assignAll(products);
       productsLoaded.value=true;
        print('Products: $products');
      },
    );
  }




  void applyFilters() {
    List<ProductEntity> filteredList = List.from(productList);

    filterOptions.forEach((key, value) {
      if (value) {
        switch (key) {
          case 'Newest':
            filteredList.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
            break;
          case 'Oldest':
            filteredList.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
            break;
          case 'Price Low>High':
            filteredList.sort((a, b) => a.price.compareTo(b.price));
            break;
          case 'Price High>Low':
            filteredList.sort((a, b) => b.price.compareTo(a.price));
            break;
          case 'Best Selling':
            filteredList.sort((a, b) => b.totalSales.compareTo(a.totalSales));
            break;
          default:
            break;
        }
      }
    });

    productList.value = filteredList;
  }

}
