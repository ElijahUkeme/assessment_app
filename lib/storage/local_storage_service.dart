import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class LocalStorageService{

  late SharedPreferences _pref;
  Future<LocalStorageService> initSharedPreference()async{
    _pref = await SharedPreferences.getInstance();
    return this;
  }
  Future<bool> setBool(String key,bool value) async {
    return await _pref.setBool(key, value);
  }
  Future<bool> setString(String key,String value) async {
    return await _pref.setString(key, value);
  }
  bool getDeviceFirstOpen(){
    return _pref.getBool(AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN)??false;
  }
  bool getIsUserLoggedIn(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }
  void clearSharedData(){
    _pref.remove(AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN);
    _pref.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
  }
}