import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/forgot_screen.dart';
import 'package:seven_min_track/view/auth/sign_up.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
import '../../widgets/custom_text_field.dart';

class ResetPassward extends StatelessWidget {
  const ResetPassward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.w,
            ),
            Image.asset("assets/icons/arrowback.png",height: 12.w,width: 5.5.w,),
            SizedBox(
              height: 88.w,
            ),
            Center(child: customTextRegular(title: "Reset Password",fontWeight: FontWeight.w600,fontSize: 24.w,color: AppColors.brownColor56)),
            SizedBox(
              height: 15.w,
            ),
            Center(child: customTextRegular(title: "Enter your new password",fontWeight: FontWeight.w400,fontSize: 16.w,color: AppColors.white)),
            SizedBox(
              height: 39.w,
            ),

            customTextRegular(title: "Password",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            SizedBox(
              height: 8.w,
            ),
            SizedBox(
              height: 47.w,
              child: textField(
                fillcolor: Colors.white,
                filled: true, suffix: true,
                prefixImage:Image.asset("assets/icons/telphone.png",color: AppColors.brownColor56,scale: 3.8,) ,isprefixImage: false,isPrefixIcon: true,
                hintText: "Passward",bordercolor: Colors.white,borderRadius: 30,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.brownColor56,size: 20.w,),

              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            customTextRegular(title: "Confirm Password",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            SizedBox(
              height: 8.w,
            ),
            SizedBox(
              height: 47.w,
              child: textField(
                fillcolor: Colors.white,
                filled: true,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.brownColor56,size: 20.w,),
                suffix: true,
                prefixImage:Image.asset("assets/icons/lock.png",color: AppColors.brownColor56,scale: 3.8,) ,isprefixImage: false,isPrefixIcon: true,
                hintText: "Confirm Passward",bordercolor: Colors.white,borderRadius: 30,
              ),
            ),
            SizedBox(height: 5.w,),

            SizedBox(height: 136.w,),
            customButton(
                ontap: (){
                  Get.to(()=> HomeScreen());
                },
                Text: "Confirm",fontWeight: FontWeight.w500,fontColor: AppColors.brownColor56,fontSize: 20.w
            ),
          ],
        ),
      ),
    );
  }
}
