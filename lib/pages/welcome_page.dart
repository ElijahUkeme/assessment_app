import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:assessment_app/storage/local_storage_service.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/welcome_bloc.dart';
import '../constants/app_constants.dart';
import '../events/welcome_event.dart';
import '../states/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc,WelcomeState>(
            builder: (context, state) {
              return Container(
                width: 375.w,
                margin: EdgeInsets.only(top: 34.h),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      },
                      children: [
                        _page(1,
                            context,
                            "Next",
                            "First See Learning",
                            "Forget about what people are being saying about Learning, Knowledge is a live foundation",
                            "assets/images/reading.png"
                        ),
                        _page(2,
                            context,
                            "Next",
                            "Connect With Everyone",
                            "Always keep in touch with your tutor and friends. Let's get connected",
                            "assets/images/boy.png"
                        ),
                        _page(3,
                            context,
                            "Get Started",
                            "Always Fascinate in Learning",
                            "We are always at your service anytime, any day. Don't wait again,Let's go",
                            "assets/images/man.png"
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 55.h,
                        child:DotsIndicator(
                          position: state.page,
                          dotsCount: 3,
                          decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              size: Size.square(8.0),
                              activeSize:Size(15.0,8.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),))
                  ],
                ),
              );
            }),

      ),
    );
  }

  Widget _page(int index, BuildContext context,String buttonText, String title,
      String subTitle,String imagePath){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 35.w,right: 35.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(index, duration:const Duration(milliseconds: 500), curve: Curves.decelerate);
            }else{
              // jump to a new page
              //store some dummy data to sharedpreferences if the user has scrolled to the sign in page
              //and closes the app. when he/she opens the app again, it needs to resume from there rather
              //than starting afresh
              Global.localStorageService.setBool(AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN, true);
              Navigator.of(context).pushNamedAndRemoveUntil("/sign-in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 50.h,left: 25.w,right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1)
                  )
                ]
            ),
            child: Center(
              child: Text(buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal
                ),),
            ),
          ),
        )
      ],
    );
  }
}
