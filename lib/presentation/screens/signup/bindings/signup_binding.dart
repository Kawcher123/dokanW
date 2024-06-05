import 'package:dokan/data/data_sources/api_manager/api_manager.dart';
import 'package:dokan/data/data_sources/remote/user_data_source.dart';
import 'package:dokan/data/repositories/user_repository_iml.dart';
import 'package:dokan/domain/repositories/user_repository.dart';
import 'package:dokan/domain/use_cases/signup_usecase.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut(() => APIManager(client: Get.find()));

    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(apiManager: Get.find(),userLocalRepository: Get.find()));

    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(userDataSource: Get.find()));
Get.lazyPut(() => SignupUSeCase(repository: Get.find()));
    Get.lazyPut<SignupController>(
      () => SignupController(signupUSeCase: Get.find()),
    );
  }
}
