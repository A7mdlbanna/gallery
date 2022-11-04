import '../../core/utils/app_local_storage.dart';

class AuthRepository{
  final String _sharedPreferenceToken = "Token";
  final String _sharedPreferenceFirstTime = "FirstTime";
  Future<String?> get accessToken => _getToken();

  Future<void> setToken(String userToken) async {
    await AppLocalStorage.saveData(key: _sharedPreferenceToken, value: userToken);
  }

  Future<String?> _getToken() async {
    return AppLocalStorage.getData(key: _sharedPreferenceToken);
  }

  bool isFirstTime() {
    return AppLocalStorage.getData(key: _sharedPreferenceFirstTime) ?? true;
  }

  Future<void> setFirstTime(bool isFirst) async {
    await AppLocalStorage.saveData(key: _sharedPreferenceFirstTime, value: isFirst);
  }

}