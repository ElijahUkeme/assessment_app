import 'package:assessment_app/events/profile_page_event.dart';
import 'package:assessment_app/states/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent,ProfilePageState>{
  ProfilePageBloc():super(ProfilePageState()){
    on<ProfilePageEvent>((event, emit) {
      emit(ProfilePageState(signUpModel: state.signUpModel));
    });
  }
}