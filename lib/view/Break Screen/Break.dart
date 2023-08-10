import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';

import '../../utils/app_colors.dart';

class BreakScreen extends StatefulWidget {
  const BreakScreen({Key? key}) : super(key: key);

  @override
  State<BreakScreen> createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {

  int change = 0;
  var selectedIndex = 0;
  bool _isPlaying = false;
  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  Timer? _timer = Timer(const Duration(seconds: 0), () {});
  int _start = 0;

  ///listview builder list
  List<double> progressList = [];
  double progress = 0.0;

  List<dynamic> percentValue = [];

  void stop() {
    if (_timer != null) {
      setState(() {
        _timer!.cancel();
      });
    }
  }

  /// minutes increment function = 1
  var minute1 = 0;

  void SevenMinutesIncrement1() {
    setState(() {});
    if (_start < 60) {
      minute1 = 0;
    } else if (_start >= 60 && _start < 120) {
      minute1 = 1;
    } else if (_start >= 120 && _start < 180) {
      minute1 = 2;
    } else if (_start >= 180 && _start < 240) {
      minute1 = 3;
    } else if (_start >= 240 && _start < 300) {
      minute1 = 4;
    }else if (_start <= 300) {
      minute1 = 5;
      stop();
    }
  }

  /// timer function

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    print("this is timer value inside if ${_start.toString()}");
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
            if (_start < 10) {
              setState(() {
                print("this is break timer = ${_start.toString()}");
                percentValue.add(_start);
                _start++;
                SevenMinutesIncrement1();
                print('the minute 1 value in  timer is $minute1');
              });
            }
          },
            );
  }

  @override
  Widget build(BuildContext context) {

    double timerValue = (_start / 10).clamp(0.0, 1.0); // Clamp the timerValue between 0.0 and 1.0

    if (timerValue >= 1.0) {
      // Timer value has reached or exceeded the desired duration, navigate to LetsGoScreen
      Future.delayed(Duration.zero, () {
       Get.back();
      });
    }

    return Scaffold(
    //  backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Container(
        height: Get.height,
          decoration: BoxDecoration(
           color: Colors.orangeAccent[200],
          //   gradient: LinearGradient(
          //     colors: [AppColors.blue, AppColors.lightgreen],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          ),
          child: Column(
            children: [
              SizedBox(height: 80.h,),

              /// short break text

              customTextRegular(title: "Short Break",fontSize: 34.h,color: Colors.white),

              /// Timer
             SizedBox(height: 40,),
              Container(
               //  color: Colors.red,
               //   height: 340.h,
                width: Get.width,
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  arcBackgroundColor: Colors.white.withOpacity(.20),
                  arcType: ArcType.FULL,
                  radius: 140,
                  animation: false,
                  progressColor: Colors.white,
                  lineWidth: 8.0,
                  percent: timerValue,
                  center: Container(
                    padding: const EdgeInsets.only(top: 45),
                    child: Column(
                      children: [
                        Text(
                           minute1.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RobotoMono-Bold',
                            fontSize: 130.0.sp,
                          ),
                        ),

                        SizedBox(height: 50.h),
                        Container(
                         height: 40,
                          width: 145,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(width: 1.w, color: Colors.white,),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _start.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text('Seconds',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoMono-Italic',
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Buttons in Row
             Spacer(),
           //   SizedBox(height: 260.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     if (progressList.isNotEmpty || progressList.length < 1 ) {
                  //       setState(() {
                  //         progressList.add(0.0);
                  //         _timer!.isActive ? stop() : startTimer();
                  //         _togglePlayPause();
                  //       });
                  //     }
                  //   },
                  //   child: Container(
                  //     height: 40,
                  //     width: 120,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(50.r)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         _isPlaying
                  //             ? Icon(Icons.pause, color: AppColors.primaryColor,size: 25.sp,)
                  //             : Icon(Icons.play_arrow, color: AppColors.primaryColor,size: 25.sp,),
                  //
                  //        _isPlaying
                  //             ? Text('pause',style: TextStyle(color: AppColors.primaryColor, fontFamily: 'RobotoMono-Regular', fontSize: 22.sp,),)
                  //             : Text('play',style: TextStyle(color: AppColors.primaryColor, fontFamily: 'RobotoMono-Regular', fontSize: 22.0.sp,),)
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Container(

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
                    child: GestureDetector(
                      onTap: () {
                      if (progressList.isNotEmpty || progressList.length < 1 ) {
                          setState(() {
                          progressList.add(0.0);
                             _timer!.isActive ? stop() : startTimer();
                           _togglePlayPause();
                             });
                             }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(_isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.black,),
                          Text(
                            "Play",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'RobotoMono-Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 118.h,),
            ],
          ),
        ),
      ),

      /// floating action speed dial button

      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 30,right: 70),
      //   child: SpeedDial(
      //     speedDialChildren: <SpeedDialChild>[
      //       SpeedDialChild(
      //         closeSpeedDialOnPressed: true,
      //         child: Icon(
      //           Icons.domain_add_sharp,
      //           color: Color(0xFFEE616A),
      //         ),
      //         foregroundColor: Colors.black,
      //         backgroundColor: Colors.white,
      //         label: 'Add Data',
      //         onPressed: () {
      //           Get.to(data());
      //         },
      //       ),
      //       SpeedDialChild(
      //         closeSpeedDialOnPressed: true,
      //         child: const Icon(
      //           Icons.free_breakfast,
      //           color: Color(0xFFEE616A),
      //         ),
      //         foregroundColor: Colors.red,
      //         backgroundColor: Colors.white,
      //         label: 'Add Break',
      //         onPressed: () {
      //           setState(() {
      //             Get.defaultDialog(title: '',
      //               content: Image.asset('assets/images/trophy.gif',), );
      //           });
      //         },
      //       ),
      //       SpeedDialChild(
      //         closeSpeedDialOnPressed: false,
      //         child: Icon(Icons.history, color: Color(0xFFEE616A),),
      //         foregroundColor: Colors.black,
      //         backgroundColor: Colors.white,
      //         label: 'History',
      //         onPressed: () {
      //         },
      //       ),
      //     ],
      //     labelsStyle: TextStyle(
      //         color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
      //     labelsBackgroundColor: Colors.deepOrange,
      //     closedForegroundColor: Color(0xFFAFD4FF),
      //     openForegroundColor: Color(0xFFEE616A),
      //     closedBackgroundColor: Colors.white,
      //     openBackgroundColor: Colors.white,
      //     child:Icon(Icons.more_vert,size: 50,),
      //   ),
      // ),

    );
  }
}