import 'package:assessment_app/storage/local_storage_service.dart';
import 'package:flutter/cupertino.dart';

class Global{
  static late LocalStorageService localStorageService;
  static Future init() async {

    localStorageService = await LocalStorageService().initSharedPreference();
  }
}