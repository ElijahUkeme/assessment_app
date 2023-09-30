import 'package:assessment_app/constants/app_constants.dart';
import 'package:assessment_app/model/sign_in_model.dart';
import 'package:assessment_app/model/sign_up_model.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/utils/network_request_utils.dart';
import 'package:assessment_app/widgets/flutter_toast_widget.dart';
import 'package:dio/dio.dart';

class SignInRepository{
  var networkRequestUtil = locator<NetworkRequestUtil>();
  late SignUpModel _signUpModel;
  SignUpModel get signUpModel=>_signUpModel;
  login ({SignInModel? signInModel}) async {
    var response = await networkRequestUtil.post(AppConstants.LOGIN_URL,data: signInModel?.toJson());

    if(networkRequestUtil.responseCode==200){
      //go ahead and store the info
    }else{
      toastInfo(msg: networkRequestUtil.errorMessage);
    }
    return response;
  }
}