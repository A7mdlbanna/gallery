import 'package:dio/dio.dart';
import '../model/user.dart';
import '../../core/utils/api_path.dart';
import '../../core/utils/api_service.dart';
import '../../core/utils/app_local_storage.dart';

class UserRepository {
  UserData? user;
  static const String _userKey = "user";

  // Login api
  Future<Response> login({required loginRequest}) async {
    print('LoginDTO: ' + loginRequest.email.toString() + " --- " + loginRequest.password.toString());
    final Response<dynamic> response = await ApiService.postApi(
      ApiPaths.login,
      body: loginRequest.toJson(),
    );
    return response;
  }

  Future<void> setUser(UserData user) async {
    this.user = user;
    await AppLocalStorage.saveMap( _userKey, user.toJson());
  }

  Future<void> removeUser() async {
    user = null;
    await AppLocalStorage.removeData(_userKey);
  }

  UserData? getUser() {
    final Map<String, dynamic>? userJson = AppLocalStorage.getMap(_userKey);
    if (userJson != null) {
      user = UserData.fromJson(userJson);
    } else {
      user = null;
    }
    return user;
  }
}
