import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/reset_passward_screen.dart';

import '../../main.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg
      ,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.blue, AppColors.lightgreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.c,
            children: [
              SizedBox(
                height: 140,
              ),
              // Center(
              //     child: Image.asset(
              //       "assets/icons/welcome1.png",
              //       width: MySize.size160,
              //       height: MySize.size180,
              //     )),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.all(12),
                width: 384.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [

                    Center(
                        child: customTextBold(
                            title: "Verification Code",
                            fontSize:22.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            textAlign: TextAlign.center)),
                    SizedBox(height: 40.h,),
                    Align(
                      alignment: Alignment.center,
                      child: Pinput(
                        defaultPinTheme: PinTheme(
                            textStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.white),
                            height: 56,
                            width:  56,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.blue),
                              borderRadius: BorderRadius.circular(12),
                            )),
                        submittedPinTheme: PinTheme(
                            height: 56,
                            width:  56,
                            textStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize:24,
                                color: AppColors.white),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.blue,
                                border: Border.all(
                                    width: 1.05, color: AppColors.blue))),
                        focusedPinTheme: PinTheme(
                            height: 56,
                            width: 56,
                            textStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.white),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1.05, color: AppColors.blackColor.withOpacity(0.25)))),
                      ),),

                    SizedBox(height: 40,),
                    TweenAnimationBuilder(
                        tween: Tween(
                            begin: const Duration(minutes: 0, seconds: 42),
                            end: Duration.zero),
                        onEnd: () {},
                        duration: (const Duration(minutes: 1, seconds: 27)),
                        builder: (BuildContext context, Duration value, Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Align(
                            alignment: Alignment.center,
                            child: Text(
                              '$minutes: $seconds',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor),
                            ),
                          );
                        }),
                    SizedBox(height: 30,),
                    SigninButton(
                      color: Colors.black.withOpacity(0.80),
                      height: 50.h,
                      child: customTextBold(title: "Next",fontSize: 22.h,fontWeight: FontWeight.w500,color: Colors.white),
                      onPressed: () {
                        Get.to(()=> ResetPasswardScreen());
                      },

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),




              // SizedBox(height:40,),
              // custombutton2(
              //   text: "Send again",
              //   buttonColor: Colors.white,
              //   height: MySize.size50,
              //   width: Get.width,
              //   ontap: (){
              //     Get.to(()=>ResetPassward());
              //   },
              //   fontColor: AppColors.themecolor,
              //   bordercolor: AppColors.themecolor,
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
