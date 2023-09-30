
import 'package:assessment_app/controller/sign_in_controller.dart';
import 'package:assessment_app/controller/sign_up_controller.dart';
import 'package:assessment_app/repository/sign_in_repository.dart';
import 'package:assessment_app/repository/sign_up_repository.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:assessment_app/utils/network_request_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

 setUpLocator()  {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerLazySingleton<NetworkRequestUtil>(() => NetworkRequestUtil());


  locator.registerLazySingleton<SignUpRepository>(() => SignUpRepository());
  locator.registerLazySingleton<SignInRepository>(() => SignInRepository());

  locator.registerLazySingleton<SignUpController>(() => SignUpController());
  locator.registerLazySingleton<SignInController>(() => SignInController());


}