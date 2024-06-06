import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dokan/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? nickName;
  UserModel({
    super.id,
    super.name,
    super.email,
    super.password,
    super.token,
    this.nickName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_display_name': name,
      'user_email': email,
      'token':token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String userId = getId(json['token']);
    return UserModel(
      id: userId,
      nickName: json['user_nicename'],
      email: json['user_email'],
      token: json['token'],
      name: json['user_display_name'] ?? '',
    );
  }

  static String getId(String token) {
    print('UserModel.getId:$token');
    try {
      late String id;
      Map<String, dynamic> decodedData = JWT.decode(token).payload;
      if (decodedData.containsKey('data') && decodedData['data'] != null && decodedData['data'].isNotEmpty) {
        if (decodedData['data']['user'] != null && decodedData['data']['user'].isNotEmpty) {
          id = decodedData['data']['user']['id'].toString();
        }
      }
      print('UserModel.getId:$id');
      return id;
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      token: user.token,
    );
  }


  factory UserModel.fromUpdateJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name']??'',
      email: json['email']??'',
      nickName: json['nickname']??'',
    );
  }
}
