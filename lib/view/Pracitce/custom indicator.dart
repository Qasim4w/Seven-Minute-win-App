import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class custom_indicator extends StatefulWidget {

  double percent;
  String? data;
  Color color;
  // Widget? Trophy;
  bool trophy ;
  custom_indicator({required this.percent,this.data,required this.trophy,required this.color});

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
        backgroundColor: widget.color,
        progressColor: Colors.white,
        lineWidth: 6.0,
        percent: widget.percent,
        center: widget.trophy
            ? Icon(
          Icons.wine_bar_sharp,
          color: Colors.yellowAccent,
        )
            : widget.data != null
            ? Text(
          widget.data!,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono-Regular',
            fontSize: 20.0.sp,
          ),
        )
            : SizedBox(), // Hide the center if data is null
      ),
    );
  }
}
