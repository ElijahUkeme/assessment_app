
import 'package:assessment_app/events/sign_up_event.dart';
import 'package:assessment_app/states/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  SignUpBloc():super(SignUpState()){
    on<NameEvent>(_nameEvent);
    on<SignUpEmailEvent>(_emailEvent);
    on<SignUpPasswordEvent>(_passwordEvent);
    on<GenderEvent>(_genderEvent);
    on<PhoneNumberEvent>(_phoneNumberEvent);
    on<AddressEvent>(_addressEvent);
  }

  void _nameEvent(NameEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(name: event.name));
  }
  void _emailEvent(SignUpEmailEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(SignUpPasswordEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(password: event.password));
  }
  void _genderEvent(GenderEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(gender: event.gender));
  }
  void _phoneNumberEvent(PhoneNumberEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }
  void _addressEvent(AddressEvent event,Emitter<SignUpState>emit){
    emit(state.copyWith(address: event.address));
  }
}