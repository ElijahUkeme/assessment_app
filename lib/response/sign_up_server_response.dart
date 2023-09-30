
class SignUpServerResponse{
  bool? success;
  String? message;

  SignUpServerResponse({this.success,this.message});

  SignUpServerResponse.fromJson(Map<String,dynamic>json){
    success = json["success"];
    message = json["message"];
  }
}