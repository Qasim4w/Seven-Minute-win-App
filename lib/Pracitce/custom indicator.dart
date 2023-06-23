import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:seven_min_track/Add%20Details/Add%20data.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class custom_indicator extends StatefulWidget {

   double percent;
  String? data;
  // Widget? Trophy;
  bool trophy ;
   custom_indicator({required this.percent,this.data,required this.trophy});

  @override
  State<custom_indicator> createState() => _custom_indicatorState();
}

class _custom_indicatorState extends State<custom_indicator> {
  bool isPlaying = false;
  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CircularPercentIndicator(
        radius: 20.0,
        backgroundColor: Colors.white,
        progressColor: Colors.white,
        lineWidth: 4.0,
        percent: widget.percent,
        center: widget.trophy ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,)
            : Text('0',
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