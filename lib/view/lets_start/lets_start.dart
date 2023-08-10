import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/Home.dart';
import 'package:seven_min_track/view/lets_go.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
class LetsStart extends StatelessWidget {
  // String  title;
  // String  description;
  //  LetsStart(  this.title,this.description,);
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 100,left: 25,right: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 100.h,),
            // SizedBox(),
            customTextRegular(title: "Enter your name",color: AppColors.white,fontSize: 16.h,fontWeight: FontWeight.w500,),
            SizedBox(height: 20.h),

            SizedBox(
              height: 50.h,
              child: TextFormField(
                textAlign: TextAlign.start,
                maxLines: 1,
                controller: _nameController,
                style: TextStyle(
                  fontFamily: 'RobotoMono-Regular',
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.black.withOpacity(0.25), width: 1.0),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  hintText: 'Enter name',
                  hintStyle: TextStyle(
                    fontFamily: 'RobotoMono-Regular',
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(()=> DummyLetsGo());
                },
                child: Hero(
                  tag: 'lets_start_button',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // gradient: LinearGradient(
                      //   colors: [Color(0xffED631C), Color(0xffED631C).withOpacity(0.40)],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Lets Start",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'RobotoMono-Bold',
                        ),
                      ),
                    ),
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
