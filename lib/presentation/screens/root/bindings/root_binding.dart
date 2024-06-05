import 'package:dokan/data/data_sources/local_data_source/product_data_source.dart';
import 'package:dokan/data/repositories/product_repository_impl.dart';
import 'package:dokan/domain/repositories/product_repository.dart';
import 'package:dokan/domain/use_cases/products_usecase.dart';
import 'package:dokan/presentation/screens/acount/controllers/acount_controller.dart';
import 'package:dokan/presentation/screens/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.lazyPut<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(productDataSource: Get.find()));
    Get.lazyPut(() => ProductsUseCase(Get.find()));

    Get.lazyPut(
      () => HomeController(Get.find()),
    );

    Get.lazyPut(
      () => AcountController(),
    );
  }
}
