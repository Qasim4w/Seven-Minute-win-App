import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_constant.dart';
import 'package:seven_min_track/view/Home%20Screen/project_detail.dart';
import 'package:seven_min_track/view/lets_go.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';
import '../Add Details/Add data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child:Column(
          children: [
            SizedBox(height: 45.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(child: customTextRegular(title: "Hello, Nouman",fontWeight: FontWeight.w700,fontSize: 24.w,color: AppColors.white)),
                     SizedBox(height: 5,),
                    Center(child: customTextRegular(title: "Your Focused Projects",fontWeight: FontWeight.w500,fontSize: 14.w,color: AppColors.white.withOpacity(0.87))),

                  ],
                ),
                Container(
                  height: 54.w,
                  width: 54.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: AppColors.brownColor56,width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/profileimage.png"),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 57.w,),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 165,
                crossAxisSpacing: 10,
                childAspectRatio: 6/4,
                mainAxisSpacing: 20,
              ), itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(()=> ProjectDetail());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                    width: 178.w,
                    decoration: BoxDecoration(
                        color: AppColors.greyd9,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        customTextRegular(title: "Joy App UI Design",fontWeight: FontWeight.w600,fontSize: 15.w,color: Colors.black,latterSpacing: 0.4),
                        SizedBox(height: 11.w,),
                        customTextRegular(title: AppConstant.lorem,fontWeight: FontWeight.w400,fontSize: 10.w,color: Colors.black.withOpacity(0.70),latterSpacing: 0.4),
                        SizedBox(height: 11.w,),
                        customTextRegular(title: "Time spent",fontWeight: FontWeight.w600,fontSize: 10.w,color: Colors.black,latterSpacing: 0.4),
                        customTextRegular(title: "2 hrs 55 mins",fontWeight: FontWeight.w600,fontSize: 15.w,color: AppColors.brownColor56,latterSpacing: 0.4),

                      ],
                    ),
                  ),
                );
              }),
            ),

          ],
        ),
      ),

      floatingActionButton: SpeedDial(
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            closeSpeedDialOnPressed: true,
            child: Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            label: 'New Projects',
            onPressed: () {
                // Get.to(LetsGoScreen());
                Get.to(()=> CreateTask());
            },
          ),
          SpeedDialChild(
            closeSpeedDialOnPressed: true,
            child: const Icon(
              Icons.contact_phone_rounded,
              color:AppColors.primaryColor,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            label: 'Contacts',
            onPressed: () {
              // setState(() {
              //   Get.to(breakScreen());
              // });
            },
          ),
          SpeedDialChild(
            closeSpeedDialOnPressed: false,
            child: Icon(
              Icons.person_outline,
              color: AppColors.primaryColor,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            label: 'Profile',
            onPressed: () {
            //  Get.to(project_details());
            },
          ),
        ],
        labelsStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Tillana-Bold', fontSize: 15.sp),
        labelsBackgroundColor: AppColors.primaryColor,
        closedForegroundColor: AppColors.brownColor56,
        openForegroundColor: AppColors.primaryColor,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.white,
        child: Icon(
          Icons.more_vert,
          size: 50,
        ),
      ),
    );
  }
}
