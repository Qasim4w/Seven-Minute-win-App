import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../Add Details/Add data.dart';
import 'breakCustom indicator.dart';

class breakScreen extends StatefulWidget {
  const breakScreen({Key? key}) : super(key: key);

  @override
  State<breakScreen> createState() => _breakScreenState();
}

class _breakScreenState extends State<breakScreen> {

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
            if (_start < 300) {
              setState(() {
                print("this is break timer = ${_start.toString()}");
                percentValue.add(_start);
                _start++;
                SevenMinutesIncrement1();
                print('the minute 1 value in  timer is $minute1');
              });
            }
            // else {
            //   setState(() {
            //     print(" else timer end ${_start.toString()}");
            //     _timer?.cancel();
            //
            //   });
            // }
          },
            );
  }


  @override
  Widget build(BuildContext context) {

    ///
    var timerValue = _start / 300;

    return Scaffold(
      backgroundColor: Color(0xFFAFD4FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50.h,),

              /// short break text
              Padding(
                padding:  EdgeInsets.only(left: 0.w,top: 0.h),
                child: Text(
                  'Short Break',
                  style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                      fontFamily: 'RobotoMono-Regular'),
                ),
              ),


              /// Timer
              SizedBox(height: 05,),
              CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                arcBackgroundColor: Colors.white.withOpacity(.20),
                arcType: ArcType.FULL,
                radius: 140,
                animation: false,
                // backgroundColor: Colors.white,
                progressColor: Colors.white,
                lineWidth: 20.0,
                percent: timerValue,
                center: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                         minute1.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RobotoMono-Bold',
                          fontSize: 130.0.sp,
                        ),
                      ),
                      SizedBox(height: 35.h),
                      Container(
                        height: 30,
                        width: 135,
                        decoration: BoxDecoration(
                          color: Color(0xFFAFD4FF),
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
                                  color: Colors.white,
                                  // fontFamily: 'Tillana-Regular',
                                  fontSize: 25.0.sp,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text('Seconds',
                                style: TextStyle(
                                  color: Colors.white,
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


              /// Buttons in Row
              SizedBox(height: 325.h,),
              Padding(
                padding: EdgeInsets.only(left: 30.w,top: 45.h,right: 100.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //       setState(() {
                    //
                    //       });
                    //
                    //   },
                    //   child: Container(
                    //     height: 50.h,
                    //     width: 50.w,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(50.r)),
                    //     child:  Icon(
                    //       Icons.stop,
                    //       color: Color(0xFFEE616A),
                    //       size: 35.sp,
                    //     ),
                    //   ),
                    // ),

                    GestureDetector(
                      onTap: () {
                        if (progressList.isNotEmpty || progressList.length < 1 ) {
                          setState(() {
                            progressList.add(0.0);
                            _timer!.isActive ? stop() : startTimer();
                            _togglePlayPause();
                          });
                        }
                      },
                      child: Container(
                        height: 60.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _isPlaying
                                ? Icon(Icons.pause, color: Color(0xFFAFD4FF),size: 25.sp,)
                                : Icon(Icons.play_arrow, color: Color(0xFFAFD4FF),size: 25.sp,),

                           _isPlaying
                                ? Text('pause',style: TextStyle(color: Color(0xFFAFD4FF), fontFamily: 'RobotoMono-Regular', fontSize: 22.sp,),)
                                : Text('play',style: TextStyle(color: Color(0xFFAFD4FF), fontFamily: 'RobotoMono-Regular', fontSize: 22.0.sp,),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// floating action speed dial button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30,right: 70),
        child: SpeedDial(
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              closeSpeedDialOnPressed: true,
              child: Icon(
                Icons.domain_add_sharp,
                color: Color(0xFFEE616A),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              label: 'Add Data',
              onPressed: () {
                Get.to(data());
              },
            ),
            SpeedDialChild(
              closeSpeedDialOnPressed: true,
              child: const Icon(
                Icons.free_breakfast,
                color: Color(0xFFEE616A),
              ),
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
              label: 'Add Break',
              onPressed: () {
                setState(() {
                  Get.defaultDialog(title: '',
                    content: Image.asset('assets/images/trophy.gif',), );
                });
              },
            ),
            SpeedDialChild(
              closeSpeedDialOnPressed: false,
              child: Icon(Icons.history, color: Color(0xFFEE616A),),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              label: 'History',
              onPressed: () {
              },
            ),
          ],
          labelsStyle: TextStyle(
              color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
          labelsBackgroundColor: Colors.deepOrange,
          closedForegroundColor: Color(0xFFAFD4FF),
          openForegroundColor: Color(0xFFEE616A),
          closedBackgroundColor: Colors.white,
          openBackgroundColor: Colors.white,
          child:Icon(Icons.more_vert,size: 50,),
        ),
      ),
    );
  }

// int _progress = 0;
}
