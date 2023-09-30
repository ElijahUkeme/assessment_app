

import 'package:assessment_app/routes/page.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
   setUpLocator();
   await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[...AppPages.allBlocProviders(context)],
        child:ScreenUtilInit(
          builder: (context,child)=>MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                iconTheme: IconThemeData(color: Colors.black),
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white)),
            onGenerateRoute: AppPages().generateRouteSettings,
            ),
          ),
        );
  }
}

