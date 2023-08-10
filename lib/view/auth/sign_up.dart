import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/reset_passward_screen.dart';

import '../../main.dart';
import '../../widgets/custom_text_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 200.h,),
            Container(
             // height: 400.h,
              width: 384.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.h,),
                      customTextRegular(title: "SIGN UP",fontWeight: FontWeight.w500,fontSize: 22.h),
                      TrackingTextInput(
                        label: "Email",
                        hint: "What's your email address?",
                        onCaretMoved: (Offset caret) {
                          // _teddyController.lookAt(caret);
                        }, onTextChanged: (String text) {  } ,
                      ),
                      TrackingTextInput(
                        label: "Password",
                        hint: "Try 'bears'...",
                        isObscured: true,
                        // onCaretMoved: (Offset caret) {
                        //   _teddyController.coverEyes(caret != null);
                        //   _teddyController.lookAt(null);
                        // },
                        onTextChanged: (String value) {
                         // _teddyController.setPassword(value);
                        }, onCaretMoved: (Offset globalCaretPosition) {  },
                      ),
                      TrackingTextInput(
                        label: "Password",
                        hint: "Try 'bears'...",
                        isObscured: true,
                        // onCaretMoved: (Offset caret) {
                        //   _teddyController.coverEyes(caret != null);
                        //   _teddyController.lookAt(null);
                        // },
                        onTextChanged: (String value) {
                          // _teddyController.setPassword(value);
                        }, onCaretMoved: (Offset globalCaretPosition) {  },
                      ),

                      SizedBox(height: 10.h,),

                      SigninButton(
                        color: Colors.black.withOpacity(0.80),
                        height: 50.h,
                        child:
                        customTextBold(title: "Sign Up",fontSize: 22.h,fontWeight: FontWeight.w500,color: Colors.white),
                        onPressed: () {
                          Get.to(()=> HomeScreen());
                        },
                        // gradient: LinearGradient(
                        //   colors: [
                        //     AppColors.blue,
                        //     AppColors.lightgreen
                        //   ],
                        //
                        //
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                      ),
                      SizedBox(height: 10.h,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
