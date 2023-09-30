abstract class SignUpEvent{
  const SignUpEvent();
}

class NameEvent extends SignUpEvent{
  final String name;
  NameEvent(this.name);
}
class SignUpEmailEvent extends SignUpEvent{
  final String email;
  SignUpEmailEvent(this.email);
}
class SignUpPasswordEvent extends SignUpEvent{
  final String password;
  SignUpPasswordEvent(this.password);
}
class GenderEvent extends SignUpEvent{
  final String gender;
  GenderEvent(this.gender);
}
class PhoneNumberEvent extends SignUpEvent{
  final String phoneNumber;
  PhoneNumberEvent(this.phoneNumber);
}
class AddressEvent extends SignUpEvent{
  final String address;
  AddressEvent(this.address);
}

