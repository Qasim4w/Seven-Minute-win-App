import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/utils/app_constant.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';

import '../Home Screen/lets_start/lets_start.dart';
import '../Home Screen/select_project.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(const Duration (seconds: 2), () {

      String? storedName = HiveBoxes.nameBox.get('nameKey');

      if (storedName != null && storedName.isNotEmpty) {
        // Name is already set in the Hive database, navigate to SelectProject screen
        Get.to(() => SelctProject());
      } else {
        // Name is not set in the Hive database, navigate to LetsStart screen after delay
        Future.delayed(const Duration(seconds: 2), () {
          Get.to(() => LetsStart());
        });
      }
    });
    //  Get.to(()=> LetsStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 642.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/treee.png"),
                      fit: BoxFit.fill,
                    )
                  ),
                  ),
                  Positioned(
                    bottom: -30,
                    child: Container(
                      height: 100.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.80),
                            offset: Offset(4,4),
                            spreadRadius: 50,
                            blurRadius: 50,
                          )
                        ],

                      ),
                    ),
                  ),
                            ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customTextRegular(title: "STAY FOCUSED PLANT TREES",fontWeight: FontWeight.w900,fontSize: 36,color: Colors.white,),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customTextRegular(title: AppConstant.tree,fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white,latterSpacing: 0.7,height: 1.2),
            ),

          ],
        ),
      ),
    );
  }
}
