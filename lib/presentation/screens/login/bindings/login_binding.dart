import 'package:dokan/data/data_sources/api_manager/api_manager.dart';
import 'package:dokan/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:dokan/data/data_sources/remote/user_data_source.dart';
import 'package:dokan/data/repositories/user_repository_iml.dart';
import 'package:dokan/domain/repositories/user_local_repository.dart';
import 'package:dokan/domain/repositories/user_repository.dart';
import 'package:dokan/domain/use_cases/login_usecase.dart';
import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../data/repositories/user_local_repository_impl.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut(() => APIManager(client: Get.find()));

    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(apiManager: Get.find()));

    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(userDataSource: Get.find()));

    Get.lazyPut(()=>LoginUseCase(Get.find()));
    Get.lazyPut(() => GetStorage());
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSourceImpl(box: Get.find()));
    Get.lazyPut<UserLocalRepository>(() => UserLocalRepositoryImpl(userLocalDataSource: Get.find()));
    Get.lazyPut(()=>UserLocalUseCase(repository: Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(loginUseCase: Get.find(),userLocalUseCase: Get.find()),
    );
  }
}
