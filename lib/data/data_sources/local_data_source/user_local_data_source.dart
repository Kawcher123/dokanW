import 'package:dokan/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class UserLocalDataSource{
  void saveUser(UserModel userModel);
  UserModel? getUser();
  void clearUser();
}


class UserLocalDataSourceImpl implements UserLocalDataSource{
  final GetStorage box ;

  UserLocalDataSourceImpl({required this.box});

  @override
  void saveUser(UserModel user) {
    print('UserLocalDataSourceImpl.saveUser:${user.id}');
    print('UserLocalDataSourceImpl.saveUser:${user.token}');
    box.write('user', user.toJson());
    getUser();
  }

  @override
  void clearUser() {
    box.remove('user');
  }

  @override
  UserModel? getUser() {
    // TODO: implement getUser

    final userData = box.read<Map<String, dynamic>>('user');
    print('UserLocalDataSourceImpl.getUser:${userData}');
    return userData!=null?UserModel.fromJson(userData):null;
  }


}
