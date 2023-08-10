import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import '../../widgets/custom_text_widgets.dart';
import '../new-login/signin_button.dart';
import '../new-login/tracking_input.dart';
import 'otp_screen.dart';
class ResetPasswardScreen extends StatelessWidget {
  //const ForgotPasswardScreen.ForgotPassward({super.key});

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
                      customTextRegular(title: "Reset Passward",fontWeight: FontWeight.w500,fontSize: 22.h),
                      TrackingTextInput(
                        label: "Email",
                        hint: "What's your email address?",
                        onCaretMoved: (Offset caret) {
                          // _teddyController.lookAt(caret);
                        }, onTextChanged: (String text) {  } ,
                      ),
                      TrackingTextInput(
                        label: "Password",
                        hint: "passward",
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
                        label: "Confirm Pass",
                        hint: "confirm Pass",
                        isObscured: true,
                        // onCaretMoved: (Offset caret) {
                        //   _teddyController.coverEyes(caret != null);
                        //   _teddyController.lookAt(null);
                        // },
                        onTextChanged: (String value) {
                          // _teddyController.setPassword(value);
                        }, onCaretMoved: (Offset globalCaretPosition) {  },
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     customTextBold(title: "Forget Passward?",fontSize: 16.h,fontWeight: FontWeight.w500,color: AppColors.blue),
                      //   ],
                      // ),
                      SizedBox(height: 10.h,),

                      SigninButton(
                        height: 50.h,
                        child:
                        customTextBold(title: "Submit",fontSize: 22.h,fontWeight: FontWeight.w500,color: Colors.white),
                        onPressed: () {
                          Get.to(()=>HomeScreen());
                        },
                        color: Colors.black.withOpacity(0.80),
                        // gradient: LinearGradient(
                        //   colors: [
                        //     AppColors.blue,
                        //     AppColors.lightgreen
                        //   ],


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
