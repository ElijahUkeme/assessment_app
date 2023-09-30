import 'package:assessment_app/blocs/sign_in_bloc.dart';
import 'package:assessment_app/model/sign_up_model.dart';
import 'package:assessment_app/model/sign_in_model.dart';
import 'package:assessment_app/repository/sign_in_repository.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:assessment_app/storage/local_storage_service.dart';
import 'package:assessment_app/utils/network_request_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants/app_constants.dart';
import '../widgets/flutter_toast_widget.dart';

class SignInController{


  var networkUtilLocator = locator<NetworkRequestUtil>();
  var signInRepositoryLocator = locator<SignInRepository>();
  SignUpModel get signUpModel => signInRepositoryLocator.signUpModel;

  Future<void> handleSignIn(BuildContext context) async {

    final state = context.read<SignInBloc>().state;
    String emailAddress = state.email;
    String password = state.password;

    try{
      SignInModel signInModel = SignInModel(email: emailAddress,password: password);
      (signInModel,context);
    }catch(e){
      toastInfo(msg: e.toString());
    }
  }
  Future <void> processLogin(SignInModel signInModel,BuildContext context)async {
    _validateInput(signInModel.email!, signInModel.password!);
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    //go ahead and inject our sign in controller using get it
    var result = await signInRepositoryLocator.login(signInModel: signInModel);

    if(networkUtilLocator.responseCode==200){
      EasyLoading.dismiss();
      //Remember user logged in so that it can resume back to the profile page
      //if the user had logged in and leave the app without logging out
      Global.localStorageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456789");
      Navigator.of(context).pushNamedAndRemoveUntil("/profile", (route) => false);
    }else{
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  void _validateInput(String email,String password){
    if(email.isEmpty){
      toastInfo(msg: "Please Enter your Email Address");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Please Enter your Password");
      return;
    }
  }
}