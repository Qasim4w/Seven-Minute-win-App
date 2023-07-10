import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/Provider/signup_provider.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/auth/reset_passward.dart';
import 'package:seven_min_track/view/auth/sign_up.dart';
import 'package:seven_min_track/view/auth/verification_screen.dart';
import 'package:seven_min_track/view/lets_go.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
import '../../widgets/custom_text_field.dart';
import 'otp_screen.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  // void ResetPass() {
  //   Get.to(() => ResetPassward());
  //   print('yes');
  // }
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
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Image.asset("assets/icons/arrowback.png",height: 12.w,width: 5.5.w,)),
            SizedBox(
              height: 88.w,
            ),
            Center(child: customTextRegular(title: "Forgot Password",fontWeight: FontWeight.w600,fontSize: 24.w,color: AppColors.brownColor56)),
            SizedBox(
              height: 15.w,
            ),
            Center(child: customTextRegular(title: "Please enter your details to get password credentials",fontWeight: FontWeight.w400,fontSize: 16.w,color: AppColors.white,align: TextAlign.center)),
            SizedBox(
              height: 39.w,
            ),

            customTextRegular(title: "Phone Number",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            SizedBox(
              height: 8.w,
            ),
            SizedBox(
              height: 47.w,
              child: textField(
                fillcolor: Colors.white,
                filled: true,
                prefixImage:Image.asset("assets/icons/telphone.png",color: AppColors.brownColor56,scale: 3.8,) ,isprefixImage: false,isPrefixIcon: true,
                hintText: "+92*******23",bordercolor: Colors.white,borderRadius: 30,
              ),
            ),
            SizedBox(
              height: 20.w,
            ),

            SizedBox(height: 136.w,),
            customButton(
              color: AppColors.lightgrey,
                ontap: (){
                //  ResetPass();
                //  Get.to(LetsGoScreen());
                //Get.to(()=>OtpScreen());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
                },
                Text: "Request OTP",fontWeight: FontWeight.w500,fontColor: AppColors.brownColor56,fontSize: 20.w
            ),
          ],
        ),
      ),
    );
  }
}