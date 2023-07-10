import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/widgets/custom_text_field.dart';

import '../../Provider/signup_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_widgets.dart';
import '../Home Screen/home_screen.dart';
class SingUpScreen extends StatelessWidget {
   SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context,);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
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
              height: 32.w,
            ),
            Center(child: customTextRegular(title: "Create an account",fontWeight: FontWeight.w600,fontSize: 24.w,color: AppColors.brownColor56)),
            SizedBox(
              height: 16.w,
            ),
            Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: customTextRegular(title: "Enter your Username, email and password.If you forget it, then you have to forgot password.",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white,align: TextAlign.center),
            )),
            SizedBox(height: 41.w,),
            customTextRegular(title: "Username",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            textField(
            NoOutlineBorder: false,
              hintText: "luqman Sardar",fontSize: 14.w,fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20.w,),
            customTextRegular(title: "Phone Number",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),

            textField(
              NoOutlineBorder: false,
              hintText: "00 000 0000 000 0",fontSize: 14.w,fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20.w,),
            customTextRegular(title: "Password",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            textField(
              NoOutlineBorder: false,
              hintText: "*******************",fontSize: 14.w,fontWeight: FontWeight.w500,
              suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.brownColor56,size: 20.w,),
            ),
            SizedBox(height: 20.w,),
            customTextRegular(title: "Confirm Password",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),

            textField(
              NoOutlineBorder: false,
              hintText: "*******************",fontSize: 14.w,fontWeight: FontWeight.w500,
              suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.brownColor56,size: 20.w,),
            ),
             SizedBox(height: 24.w,),

            Consumer<SignUpProvider>(builder: (context,_,SignUpProvider){
              return  Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      signUpProvider.isCheck();
                    },
                    child: Container(
                      height: 18.w,
                      width: 19.w,
                      decoration: BoxDecoration(
                          color: signUpProvider.isChecked? AppColors.brownColor56: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: AppColors.brownColor56)
                      ),
                      child:signUpProvider.isChecked? Center(child: Icon(Icons.check,color: Colors.white,size: 13,)): Text(""),
                    ),
                  ),
                  SizedBox(width: 6,),
                  customTextRegular(title: "Remember me",fontWeight: FontWeight.w400,fontSize: 12.w,color: AppColors.white),

                ],
              );
            }),
              SizedBox(height: 104.w,),
              customButton(ontap: (){
                Get.to(()=> HomeScreen());
              },Text: "Sign Up",fontColor: AppColors.brownColor56,),
            SizedBox(height: 20.w,),
            Center(
              child: GestureDetector
                (
                onTap: (){
                  Get.to(()=>SingUpScreen());
                  print('yes');
                },
                child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Don’t have an account? ",style: TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500) ),

                      TextSpan(text: "Sign up",style: TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500,color: AppColors.brownColor56) ),



                    ]
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
