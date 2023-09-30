
import 'package:assessment_app/blocs/profile_page_bloc.dart';
import 'package:assessment_app/blocs/sign_in_bloc.dart';
import 'package:assessment_app/blocs/sign_up_bloc.dart';
import 'package:assessment_app/blocs/welcome_bloc.dart';
import 'package:assessment_app/entities/page_entity.dart';
import 'package:assessment_app/pages/profile_page.dart';
import 'package:assessment_app/pages/sign_in_page.dart';
import 'package:assessment_app/pages/sign_up_page.dart';
import 'package:assessment_app/pages/welcome_page.dart';
import 'package:assessment_app/routes/name.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages{
  static List<PageEntity> routes(){
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomePage(),
          bloc: BlocProvider(create: (_)=>WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignInPage(),
          bloc: BlocProvider(create: (_)=>SignInBloc())),
      PageEntity(
          route: AppRoutes.SIGN_UP,
          page: const SignUpPage(),
          bloc: BlocProvider(create: (_)=>SignUpBloc())),
      PageEntity(
          route: AppRoutes.PROFILE,
          page: const ProfilePage(),
          bloc: BlocProvider(create: (_)=>ProfilePageBloc()))
    ] ;
  }

  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name !=null){
      //check for route name matching when navigation get triggered
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen = Global.localStorageService.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL && deviceFirstOpen){
          return MaterialPageRoute(builder: (_)=>const SignInPage(),settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);

      }
    }
    return MaterialPageRoute(builder: (_)=>const SignInPage(),settings: settings);
  }
}