import 'package:assessment_app/controller/sign_in_controller.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/sign_in_bloc.dart';
import '../events/sign_in_event.dart';
import '../states/sign_in_state.dart';
import '../widgets/login_and_registration_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SignInBloc,SignInState>(
        builder:(context,state){
          return Container(
            color: Colors.white,
            child: SafeArea(
                child:Scaffold(
                  appBar:buildAppBar("Sign In"),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildThirdPartyLogin(context),
                        Center(child: reuseAbleText("Or use your email to login")),
                        Container(
                          margin: EdgeInsets.only(top: 30.h),
                          padding: EdgeInsets.only(left: 30.w,right: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reuseAbleText("Email"),
                              SizedBox(height: 5.h,),
                              buildTextField("Email", "Enter your Email Address","user",
                                      (value){
                                    context.read<SignInBloc>().add(EmailEvent(value));
                                  }),
                              reuseAbleText("Password"),
                              SizedBox(height: 5.h,),
                              buildTextField("Password", "Enter your Password","lock",
                                      (value){
                                    context.read<SignInBloc>().add(PasswordEvent(value));
                                  }),
                            ],
                          ),
                        ),
                        //forgotPasswordText(),
                        buildLoginAndRegisterButton("Login",Colors.blue,Colors.white,(){
                          print("Login Function called");
                          locator<SignInController>().handleSignIn(context);
                        }),
                        buildLoginAndRegisterButton("Not Registered? Register Here", Colors.white, Colors.grey,(){
                          print("Registered Page called");
                          Navigator.of(context).pushNamed("/sign-up");
                        })
                      ],
                    ),
                  ),
                ) ),
          );
        });
  }
}
