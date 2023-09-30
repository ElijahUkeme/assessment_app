import 'package:assessment_app/blocs/sign_up_bloc.dart';
import 'package:assessment_app/controller/sign_up_controller.dart';
import 'package:assessment_app/events/sign_up_event.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/states/sign_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/login_and_registration_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SignUpBloc,SignUpState>(builder: (context,state){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child:Scaffold(
              appBar:buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: reuseAbleText("Sign up with your details for free")),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 30.w,right: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText("UserName"),
                          buildTextField("UserName", "Enter your UserName","user",
                                  (value){
                                context.read<SignUpBloc>().add(NameEvent(value));
                              }),
                          reuseAbleText("Email"),
                          buildTextField("Email", "Enter your Email Address","user",
                                  (value){
                                context.read<SignUpBloc>().add(SignUpEmailEvent(value));
                              }),
                          reuseAbleText("Password"),
                          buildTextField("Password", "Enter your Password","lock",
                                  (value){
                                context.read<SignUpBloc>().add(SignUpPasswordEvent(value));
                              }),
                          reuseAbleText("Gender"),
                          buildTextField("Gender", "Enter your Gender","person",
                                  (value){
                                context.read<SignUpBloc>().add(GenderEvent(value));
                              }),
                          reuseAbleText("Phone"),
                          buildTextField("Phone", "Enter your Phone Number","phone-call",
                                  (value){
                                context.read<SignUpBloc>().add(PhoneNumberEvent(value));
                              }),
                          reuseAbleText("Address"),
                          buildTextField("Address", "Enter your Address","home",
                                  (value){
                                context.read<SignUpBloc>().add(AddressEvent(value));
                              }),
                        ],
                      ),
                    ),
                    buildLoginAndRegisterButton("Register", Colors.blue,Colors.white,(){
                      locator<SignUpController>().handleSignUp(context);
                    })
                  ],
                ),
              ),
            ) ),
      );
    });
  }
}
