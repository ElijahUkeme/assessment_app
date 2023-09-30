
import 'package:assessment_app/values/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Icon(icon,color: const Color(0xFFBFC2DF),),
          SizedBox(width: 10.w,),
          Text(text,style: TextStyle(fontSize: 16,color: AppColors.textColor,fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}