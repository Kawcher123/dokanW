import 'package:dokan/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:dokan/data/repositories/user_local_repository_impl.dart';
import 'package:dokan/domain/repositories/user_local_repository.dart';
import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/acount_controller.dart';

class AcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStorage());
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSourceImpl(box: Get.find()));
    Get.lazyPut<UserLocalRepository>(() => UserLocalRepositoryImpl(userLocalDataSource: Get.find()));
    Get.lazyPut(()=>UserLocalUseCase(repository: Get.find()));
    Get.lazyPut(
          () => AcountController(userLocalUseCase: Get.find(),updateUserUseCase: Get.find()),
    );
  }
}
