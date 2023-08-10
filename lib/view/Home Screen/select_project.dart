import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Add%20Details/Add%20data.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';

import '../../widgets/custom_text_widgets.dart';

class SelctProject extends StatefulWidget {
  @override
  State<SelctProject> createState() => _SelctProjectState();
}

class _SelctProjectState extends State<SelctProject>with TickerProviderStateMixin {
 // const SelctProject({super.key});
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    late AnimationController _controller;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation.
    _controller.forward();
//    openHiveBox();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(),
                Column(
                  children: [
                    Text("Welcome",style: TextStyle(fontSize: 40.h,fontWeight: FontWeight.w800,color: Colors.white),),
                    SizedBox(height: 10.h,),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        final nameBox = Hive.box<String>('nameBox'); // Access the Hive box
                        final retrievedName = nameBox.get('nameKey') ??  "Hello, Nouman"; // Use a default value if the retrieved name is null

                        return Center(
                          child: Opacity(
                            opacity: _animation.value,
                            child: customTextRegular(
                              title: retrievedName,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.w,
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            Container(
              margin: EdgeInsets.only(bottom:80 ),
              height: 40,
              width: 127,
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {

                  Get.to(()=> HomeScreen());

                },
                child: Center(
                  child: Text(
                    "Select Project",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'RobotoMono-Bold',
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 100.h),


          ],
        ),
      ),
    );
  }
}
