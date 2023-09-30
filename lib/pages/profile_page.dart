import 'package:assessment_app/blocs/profile_page_bloc.dart';
import 'package:assessment_app/controller/sign_in_controller.dart';
import 'package:assessment_app/services/service_locator.dart';
import 'package:assessment_app/states/profile_page_state.dart';
import 'package:assessment_app/storage/global.dart';
import 'package:assessment_app/values/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_icon_text_widgets.dart';
import '../widgets/clipper_widget.dart';
import '../widgets/profile_column_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var signInControllerLocator = locator<SignInController>();
  @override
  Widget build(BuildContext context) {
     return  BlocBuilder<ProfilePageBloc,ProfilePageState>(
       builder: (context,state){
         return Container(
           height: double.maxFinite,
           width: double.maxFinite,
           color: Colors.white,
           child: Stack(
             children: [
               ClipPath(
                 clipper: MyClipper(),
                 child: Container(
                   height: MediaQuery.of(context).size.height *0.4,
                   width: double.maxFinite,
                   decoration: BoxDecoration(
                       gradient: LinearGradient(colors:gradientColor,
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight)
                   ),
                 ),
               ),
               Positioned(
                 top: 150.h,
                 right: 30.w,
                 left: 30.w,
                 bottom: 30.h,
                 child: Card(
                   elevation: 8,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   child: Container(
                       height: double.maxFinite,
                       width: double.maxFinite,
                       padding: EdgeInsets.only(top: 90.h),
                       child: Column(
                         children: [
                           ElevatedButton(onPressed: (){
                             //Get.toNamed(RouteHelper.getUserDetailsPage());
                           },
                               style: ElevatedButton.styleFrom(
                                   primary: Color(0xff8F6ED5),
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(8)
                                   )
                               ),
                               child: Container(
                                   width: 120.w,
                                   height: 35.h,
                                   child: const Center(
                                       child: Text("View Full Profile",style: TextStyle(
                                           fontWeight: FontWeight.bold),))
                               )
                           ),
                           //text data
                           Padding(
                             padding:  EdgeInsets.only(top: 20.h),
                             child: const Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 ProfileColumnWidget(firstText: "5000", secondText: "Followers"),
                                 ProfileColumnWidget(firstText: "23000", secondText: "Likes"),
                                 ProfileColumnWidget(firstText: "700", secondText: "Shares")
                               ],
                             ),

                           ),
                           Padding(
                             padding:  EdgeInsets.only(
                                 top: 10.h,
                                 bottom: 5.h,
                                 right: 20.w,
                                 left: 20.w
                             ),
                             child: const Divider(
                               thickness: 1,
                               color: Colors.blueGrey,
                             ),
                           ),
                            Text(
                             signInControllerLocator.signUpModel.name!,
                             style: TextStyle(
                                 fontSize: 18,
                                 color: Color(0xff525F7F)
                             ),
                           ),
                           SizedBox(height: 2,),
                            Text(
                             signInControllerLocator.signUpModel.address!,
                             style: TextStyle(
                                 fontSize: 18,
                                 color: Color(0xff525F7F)
                             ),
                           ),
                           SizedBox(height: 2,),
                            Text(
                             signInControllerLocator.signUpModel.phoneNumber!,
                             style: TextStyle(
                                 fontSize: 18,
                                 color: Color(0xff525F7F)
                             ),
                           ),
                           Padding(
                             padding:  EdgeInsets.only(
                                 top: 10.h,
                                 bottom: 5.h,
                                 right: 20.w,
                                 left: 20.w
                             ),
                             child: const Divider(
                               thickness: 0.5,
                               color: Colors.blueGrey,
                             ),
                           ),
                           GestureDetector(
                               onTap: (){
                                 Global.localStorageService.clearSharedData();
                                 Navigator.of(context).pushNamedAndRemoveUntil("/sign-in", (route) => false);
                               },
                               child: const AppIconText(icon: Icons.login_outlined, text: "Logout"))
                         ],
                       )
                   ),
                 ),
               ),
               Positioned(
                 top: 70.h,
                 left: MediaQuery.of(context).size.width /2-75,
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(75),
                     child: Container(
                       height: 150,
                       width: 150,
                       decoration: const BoxDecoration(
                           image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage("assets/images/view.png"))
                       ),
                     )
                 ),
               ),
             ],
           ),
         );

       });
  }
}
