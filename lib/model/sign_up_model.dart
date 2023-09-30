
class SignUpModel{
  String? name;
  String? email;
  String? password;
  String? gender;
  String? phoneNumber;
  String? address;

  SignUpModel({this.name,this.email,this.password,this.gender,
  this.phoneNumber,this.address});

  Map<String, dynamic> toJson()=>{
    "name":name,
    "email":email,
    "password":password,
    "gender":gender,
    "phoneNumber":phoneNumber,
    "address":address
  };

  SignUpModel.fromJson(Map<String,dynamic>json){
    name = json["name"];
    email = json["email"];
    gender = json["password"];
    phoneNumber = json["phoneNumber"];
    address = json ["address"];
  }
}