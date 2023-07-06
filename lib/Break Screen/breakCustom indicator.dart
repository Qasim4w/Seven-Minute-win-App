import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class breakCustom_indicator extends StatelessWidget {
   double percent;
   String data;
   breakCustom_indicator({required this.percent, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CircularPercentIndicator(
        radius: 20.0,
        backgroundColor: Colors.white,
        progressColor: Colors.white,
        lineWidth: 4.0,
        percent: percent,
        center: Text(data,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono-Regular',
            fontSize: 20.0.sp,
          ),
        ),
      ),
    );
  }
}
//data == 7 ? Icon(Icons.add) :