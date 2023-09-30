

import 'package:assessment_app/blocs/sign_up_bloc.dart';
import 'package:assessment_app/model/sign_up_model.dart';
import 'package:assessment_app/repository/sign_up_repository.dart';
import 'package:assessment_app/response/sign_up_server_response.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/utils/network_request_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../widgets/flutter_toast_widget.dart';

class SignUpController{

  var networkUtilLocator = locator<NetworkRequestUtil>();
  var signUpRepositoryLocator = locator<SignUpRepository>();

  Future<void> handleSignUp(BuildContext context)async {
    final state = context.read<SignUpBloc>().state;
    String name = state.name;
    String email = state.email;
    String password = state.password;
    String gender = state.gender;
    String phone = state.phoneNumber;
    String address = state.address;

    try{
      SignUpModel signUpModel = SignUpModel(name: name,email: email,password: password,
          gender: gender,phoneNumber: phone,address: address);
      processSignUp(signUpModel, context);
    }catch(e){
      print(e.toString());
    }

  }

  Future<void> processSignUp(SignUpModel signUpModel,BuildContext context) async {
    _validateInput(signUpModel.name!, signUpModel.email!, signUpModel.password!, signUpModel.gender!,
        signUpModel.phoneNumber!, signUpModel.address!);
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true
    );
    var result = await signUpRepositoryLocator.signUp(signUpModel: signUpModel);
    if(networkUtilLocator.responseCode==201){
      EasyLoading.dismiss();

      Navigator.of(context).pushNamedAndRemoveUntil("/sign-in", (route) => false);
    }else{
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  void _validateInput(String name, String email,String password,String gender,String phone,String address){

    if(name.isEmpty){
      toastInfo(msg: "Please Enter your Name");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "Please Enter your Email Address");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Please Enter your Password");
      return;
    }
    if(gender.isEmpty){
      toastInfo(msg: "Please Enter your Gender");
      return;
    }
    if(phone.isEmpty){
      toastInfo(msg: "Please Enter your Phone Number");
      return;
    }
    if(address.isEmpty){
      toastInfo(msg: "Please Enter your Residential Address");
      return;
    }
  }
}