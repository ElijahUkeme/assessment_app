
import 'package:assessment_app/events/sign_in_event.dart';
import 'package:assessment_app/states/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super (const SignInState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);

  }
  void _emailEvent(EmailEvent event,Emitter<SignInState> emit){
    print("My Email Address is ${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event,Emitter<SignInState> emit){
    print("My typed password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}