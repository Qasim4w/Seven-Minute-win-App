import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';
import 'package:seven_min_track/view/auth/reset_passward.dart';
import 'package:seven_min_track/widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';

class OtpScreen extends StatefulWidget {
 const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>with TickerProviderStateMixin {
  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController(text: 'Hello');
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              height: 88.w,
            ),

            Center(child: customTextRegular(title: "OTP",fontWeight: FontWeight.w600,fontSize: 24.w,color: AppColors.brownColor56)),
            SizedBox(height: 15.w,),
            Center(child: customTextRegular(title: "Please enter the OTP sent to",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white)),
            Center(child: customTextRegular(title: "+95 ****************213",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white)),
            SizedBox(height: 66.w,),
            customTextRegular(title: "OTP",fontWeight: FontWeight.w400,fontSize: 14.w,color: AppColors.white),
            SizedBox(height: 8.w,),

            Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: PinTheme(
                textStyle: TextStyle(fontSize: 24,color: Colors.white),

                  height: 56,
                  width:  56,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.brownColor56),
                    borderRadius: BorderRadius.circular(12),
                  )),
              submittedPinTheme: PinTheme(
                  height:  56,
                  width:  56,
                  textStyle: TextStyle(fontSize: 24,color: Colors.white),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                      border: Border.all(
                          width: 1.05, color: AppColors.brownColor56))),
              focusedPinTheme: PinTheme(
                  height:  56,
                  width:  56,
                  textStyle: TextStyle(fontSize: 24,color: Colors.white),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1.05, color: AppColors.brownColor56))),
            ),

            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextRegular(title: "Didn’t receive OTP? ",fontWeight: FontWeight.w500,fontSize: 14.w,color: AppColors.white),
                customTextRegular(title: "Resend",fontWeight: FontWeight.w500,fontSize: 14.w,color: AppColors.brownColor56),

              ],
            ),
            SizedBox(height: 113.w,),
            customButton(
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassward()),
                );
              },
              // ontap: (){
              //     Get.to(()=>ResetPassward());
              // },
              Text: "Continue",
              color: AppColors.lightgrey,
              fontWeight: FontWeight.w500,
              fontSize: 20.w,
              fontColor: AppColors.brownColor56,
            )



          ],
        ),
      ),
    );
  }
}
