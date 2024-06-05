import 'package:dokan/data/data_sources/api_manager/api_manager.dart';
import 'package:dokan/data/data_sources/local_data_source/product_data_source.dart';
import 'package:dokan/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:dokan/data/data_sources/remote/user_data_source.dart';
import 'package:dokan/data/repositories/product_repository_impl.dart';
import 'package:dokan/data/repositories/user_local_repository_impl.dart';
import 'package:dokan/data/repositories/user_repository_iml.dart';
import 'package:dokan/domain/repositories/product_repository.dart';
import 'package:dokan/domain/repositories/user_repository.dart';
import 'package:dokan/domain/use_cases/products_usecase.dart';
import 'package:dokan/domain/use_cases/update_usecase.dart';
import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:dokan/presentation/screens/acount/controllers/acount_controller.dart';
import 'package:dokan/presentation/screens/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../domain/repositories/user_local_repository.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(productDataSource: Get.find()));
    Get.lazyPut(() => ProductsUseCase(Get.find()));

    Get.lazyPut(
      () => HomeController(Get.find()),
    );

    Get.lazyPut(() => GetStorage());
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSourceImpl(box: Get.find()));
    Get.lazyPut<UserLocalRepository>(() => UserLocalRepositoryImpl(userLocalDataSource: Get.find()));
    Get.lazyPut(()=>UserLocalUseCase(repository: Get.find()));

    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut(() => APIManager(client: Get.find()));
    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(apiManager: Get.find(), userLocalRepository: Get.find()));
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(userDataSource: Get.find()));
    Get.lazyPut(()=>UpdateUserUseCase(repository: Get.find()));
    Get.lazyPut<RootController>(
          () => RootController(userLocalUseCase: Get.find()),
    );
    Get.lazyPut(
          () => AcountController(userLocalUseCase: Get.find(),updateUserUseCase: Get.find()),
    );
  }
}
