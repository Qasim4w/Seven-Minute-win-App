import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_min_track/utils/app_colors.dart';

import '../widgets/custom_text_widgets.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/icons/arrowback.png",height: 12.w,width: 5.5.w,),
                Center(child: customTextRegular(title: "Joy App UI",fontWeight: FontWeight.w600,fontSize: 20.w,color: AppColors.white.withOpacity(0.87))),

                SizedBox(),
              ],
            ),
            SizedBox(height: 41.w,),


          ],
        ),
      ),
    );
  }
}
