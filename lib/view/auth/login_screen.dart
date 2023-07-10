import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/forgot_screen.dart';
import 'package:seven_min_track/view/auth/sign_up.dart';
import 'package:seven_min_track/view/auth/verification_screen.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';

import '../../widgets/custom_text_field.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  //
  // void forgotScreenNavigation() {
  //   Get.to(() => ForgotScreen());
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
            Image.asset("assets/icons/arrowback.png",height: 12.w,width: 5.5.w,),
            SizedBox(
              height: 88.w,
            ),
            Center(child: customTextRegular(title: "Welcome Back",fontWeight: FontWeight.w600,fontSize: 24.w,color: AppColors.brownColor56)),
            SizedBox(
              height: 15.w,
            ),
            Center(child: customTextRegular(title: "Please login to continue to your account",fontWeight: FontWeight.w400,fontSize: 16.w,color: AppColors.white)),
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
                hintText: "Enter your Email",bordercolor: Colors.white,borderRadius: 30,
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            customTextRegular(title: "Password",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            SizedBox(
              height: 8.w,
            ),
            SizedBox(
              height: 47.w,
              child: textField(
                fillcolor: Colors.white,
                filled: true,
                prefixImage:Image.asset("assets/icons/lock.png",color: AppColors.brownColor56,scale: 3.8,) ,isprefixImage: false,isPrefixIcon: true,
                hintText: "Enter your Password",bordercolor: Colors.white,borderRadius: 30,
              ),
            ),
            SizedBox(height: 5.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                  //    forgotScreenNavigation();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotScreen()),
                      );
                      print('yes');
                    },
                    child: customTextRegular(title: "Forgot Password?",fontWeight: FontWeight.w500,fontSize: 12.w,color: AppColors.brownColor56)),

              ],
            ),
            SizedBox(height: 136.w,),
            customButton(
              color: AppColors.lightgrey,
              ontap: (){

                Get.to(()=> HomeScreen());
              },
                Text: "Log In",fontWeight: FontWeight.w500,fontColor: AppColors.brownColor56,fontSize: 20.w
            ),
            SizedBox(height: 15.w,),

            Center(
              child: GestureDetector
                (
                onTap: (){
                Get.to(()=>SingUpScreen());

                },
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Don’t have an account? ",style: TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500) ),

                    TextSpan(text: "Sign up",style: TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500,color: AppColors.brownColor56) ),

                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
