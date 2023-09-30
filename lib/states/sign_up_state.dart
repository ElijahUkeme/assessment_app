class SignUpState{
  final String name;
  final String email;
  final String password;
  final String gender;
  final String phoneNumber;
  final String address;

  SignUpState({this.name="",this.email="",this.password="",this.gender="",this.phoneNumber="",this.address=""});
  SignUpState copyWith({String? name,String? email,String? password,String? gender,String? phoneNumber,String? address}){
    return SignUpState(name: name??this.name,email: email??this.email,password: password??this.password,
    gender: gender??this.gender,phoneNumber: phoneNumber??this.phoneNumber,address: address??this.address);
  }
}