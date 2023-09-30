
import 'package:assessment_app/model/sign_up_model.dart';
import 'package:assessment_app/constants/app_constants.dart';
import 'package:assessment_app/response/sign_up_server_response.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/utils/network_request_utils.dart';
import 'package:assessment_app/widgets/flutter_toast_widget.dart';
class SignUpRepository{

  var networkRequestUtilLocator = locator<NetworkRequestUtil>();
   signUp({SignUpModel? signUpModel}) async {
    var response = await networkRequestUtilLocator.post(AppConstants.SIGN_UP_URL,data: signUpModel?.toJson());
    if(networkRequestUtilLocator.responseCode !=201){
      toastInfo(msg: networkRequestUtilLocator.errorMessage);
    }
    return SignUpServerResponse.fromJson(response);
  }
}