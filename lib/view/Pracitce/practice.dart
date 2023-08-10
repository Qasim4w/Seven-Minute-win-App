// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_navigation/get_navigation.dart';
// // import 'package:percent_indicator/circular_percent_indicator.dart';
// // import 'package:seven_min_track/Models/ProjectModel.dart';
// // import 'package:seven_min_track/Pracitce/custom%20indicator.dart';
// // import 'package:simple_speed_dial/simple_speed_dial.dart';
// //
// // import '../Add Details/Add data.dart';
// // import '../Boxes/boxes.dart';
// // import '../Break Screen/Break.dart';
// // import '../Models/TimerModel.dart';
// // import '../Projects details/project details.dart';
// //
// // class PracticeScreen extends StatefulWidget {
// //   const PracticeScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<PracticeScreen> createState() => _PracticeScreenState();
// // }
// //
// // class _PracticeScreenState extends State<PracticeScreen> {
// //
// //   List<TimerTracksModel> progressList = [];
// //
// //   var selectedIndex = 0;
// //   bool _isPlaying = false;
// //   void _togglePlayPause() {
// //     setState(() {
// //       _isPlaying = !_isPlaying;
// //     });
// //   }
// //
// //   Timer? _timer = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer1 = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer2 = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer3 = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer4 = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer5 = Timer(const Duration(seconds: 0), () {});
// //   Timer? _timer6 = Timer(const Duration(seconds: 0), () {});
// //   int _start  = 0;
// //   int _start1 = 0;
// //   int _start2 = 0;
// //   int _start3 = 0;
// //   int _start4 = 0;
// //   int _start5 = 0;
// //   int _start6 = 0;
// //
// //   ///listview builder list
// //   //  List<double> progressList = [];
// //   int value = 0;
// //   double progress = 0.0;
// //
// //   List<dynamic> percentValue = [];
// //
// //   void stop() {
// //     if (_timer != null) {
// //       setState(() {
// //         _timer!.cancel();
// //         _timer1!.cancel();
// //         _timer2!.cancel();
// //         _timer3!.cancel();
// //         _timer4!.cancel();
// //         _timer5!.cancel();
// //         _timer6!.cancel();
// //       });
// //     }
// //   }
// //
// //   /// minutes increment function = 1
// //   var minute1 = 0;
// //   bool trophy1 = false;
// //   bool trophy2 = false;
// //   bool trophy3 = false;
// //   bool trophy4 = false;
// //   bool trophy5 = false;
// //   bool trophy6 = false;
// //   bool trophy7 = false;
// //
// //   SevenMinutesIncrement1() {
// //     setState(() {});
// //     if (_start < 60) {
// //       minute1 = 0;
// //     } else if (_start >= 60 && _start < 120) {
// //     minute1 = 1;
// //     trophy1=true;
// //     } else if (_start >= 120 && _start < 180) {
// //       minute1 = 2;
// //
// //       print('trophy 1 value = $trophy1');
// //     } else if (_start >= 180 && _start < 240) {
// //       minute1 = 3;
// //     } else if (_start >= 240 && _start < 300) {
// //       minute1 = 4;
// //     } else if (_start >= 300 && _start < 360) {
// //       minute1 = 5;
// //     } else if (_start >= 360 && _start < 420) {
// //       minute1 = 6;
// //     } else if (_start == 420) {
// //       minute1 = 7;
// //       trophy1=true;
// //       print('trophy 1 value = $trophy1');
// //     }
// //   }
// //
// //   /// minutes increment function = 2
// //   var minute2 = 0;
// //
// //   void SevenMinutesIncrement2() {
// //     setState(() {});
// //     if (_start1 < 60) {
// //       minute2 = 0;
// //     } else if (_start1 >= 60 && _start1 < 120) {
// //       minute2 = 1;
// //     } else if (_start1 >= 120 && _start1 < 180) {
// //       trophy2 = true;
// //       print('trophy 2 value = $trophy2');
// //       minute2 = 2;
// //     } else if (_start1 >= 180 && _start1 < 240) {
// //       minute2 = 3;
// //     } else if (_start1 >= 240 && _start1 < 300) {
// //       minute2 = 4;
// //     } else if (_start1 >= 300 && _start1 < 360) {
// //       minute2 = 5;
// //     } else if (_start1 >= 360 && _start1 < 420) {
// //       minute2 = 6;
// //     } else if (_start1 == 420) {
// //       minute2 = 7;
// //
// //     }
// //   }
// //
// //   /// minutes increment function = 3
// //   var minute3 = 0;
// //
// //   void SevenMinutesIncrement3() {
// //     setState(() {});
// //     if (_start2 < 60) {
// //       minute3 = 0;
// //     } else if (_start2 >= 60 && _start2 < 120) {
// //       minute3 = 1;
// //     } else if (_start2 >= 120 && _start2 < 180) {
// //
// //       print('trophy 3 value = $trophy3');
// //       minute3 = 2;
// //     } else if (_start2 >= 180 && _start2 < 240) {
// //       trophy3 = true;
// //       minute3 = 3;
// //     } else if (_start2 >= 240 && _start2 < 300) {
// //       minute3 = 4;
// //     } else if (_start2 >= 300 && _start2 < 360) {
// //       minute3 = 5;
// //     } else if (_start2 >= 360 && _start2 < 420) {
// //       minute3 = 6;
// //     } else if (_start2 == 420) {
// //       minute3 = 7;
// //
// //     }
// //   }
// //
// //   /// minutes increment function = 4
// //   var minute4 = 0;
// //
// //   void SevenMinutesIncrement4() {
// //     setState(() {});
// //     if (_start3 < 60) {
// //       minute4 = 0;
// //     } else if (_start3 >= 60 && _start3 < 120) {
// //       minute4 = 1;
// //     } else if (_start3 >= 120 && _start3 < 180) {
// //       minute4 = 2;
// //       trophy4 = true;
// //       print('trophy 4 value = $trophy4');
// //     } else if (_start3 >= 180 && _start3 < 240) {
// //       minute4 = 3;
// //     } else if (_start3 >= 240 && _start3 < 300) {
// //       minute4 = 4;
// //     } else if (_start3 >= 300 && _start3 < 360) {
// //       minute4 = 5;
// //     } else if (_start3 >= 360 && _start3 < 420) {
// //       minute4 = 6;
// //     } else if (_start3 == 420) {
// //       minute4 = 7;
// //
// //     }
// //   }
// //
// //   /// minutes increment function = 5
// //   var minute5 = 0;
// //
// //   void SevenMinutesIncrement5() {
// //     setState(() {});
// //     if (_start4 < 60) {
// //       minute5 = 0;
// //     } else if (_start4 >= 60 && _start4 < 120) {
// //       minute5 = 1;
// //     } else if (_start4 >= 120 && _start4 < 180) {
// //       minute5 = 2;
// //       trophy5 = true;
// //       print('trophy 5 value = $trophy5');
// //     } else if (_start4 >= 180 && _start4 < 240) {
// //       minute5 = 3;
// //     } else if (_start4 >= 240 && _start4 < 300) {
// //       minute5 = 4;
// //     } else if (_start4 >= 300 && _start4 < 360) {
// //       minute5 = 5;
// //     } else if (_start4 >= 360 && _start4 < 420) {
// //       minute5 = 6;
// //     } else if (_start4 == 420) {
// //       minute5 = 7;
// //     }
// //   }
// //
// //   /// minutes increment function = 6
// //   var minute6 = 0;
// //
// //   void SevenMinutesIncrement6() {
// //     setState(() {});
// //     if (_start5 < 60) {
// //       minute6 = 0;
// //     } else if (_start5 >= 60 && _start5 < 120) {
// //       minute6 = 1;
// //     } else if (_start5 >= 120 && _start5 < 180) {
// //       minute6 = 2;
// //       trophy6 = true;
// //       print('trophy 6 value = $trophy6');
// //     } else if (_start5 >= 180 && _start5 < 240) {
// //       minute6 = 3;
// //     } else if (_start5 >= 240 && _start5 < 300) {
// //       minute6 = 4;
// //     } else if (_start5 >= 300 && _start5 < 360) {
// //       minute6 = 5;
// //     } else if (_start5 >= 360 && _start5 < 420) {
// //       minute6 = 6;
// //     } else if (_start5 == 420) {
// //       minute6 = 7;
// //
// //     }
// //   }
// //
// //   /// minutes increment function = 7
// //   var minute7 = 0;
// //
// //   void SevenMinutesIncrement7() {
// //     setState(() {});
// //     if (_start6 < 60) {
// //       minute7 = 0;
// //     } else if (_start6 >= 60 && _start6 < 120) {
// //       minute7 = 1;
// //     } else if (_start6 >= 120 && _start6 < 180) {
// //       minute7 = 2;
// //       trophy7 = true;
// //       print('trophy 7 value = $trophy7');
// //     } else if (_start6 >= 180 && _start6 < 240) {
// //       minute7 = 3;
// //     } else if (_start6 >= 240 && _start6 < 300) {
// //       minute7 = 4;
// //     } else if (_start6 >= 300 && _start6 < 360) {
// //       minute7 = 5;
// //     } else if (_start6 >= 360 && _start6 < 420) {
// //       minute7 = 6;
// //     } else if (_start6 == 420) {
// //       minute7 = 7;
// //
// //     }
// //   }
// //
// // /// timer function
// //   bool showIcon = false;
// //   void startTimer() {
// //     const oneSec = Duration(seconds: 1);
// //     _timer = Timer.periodic(oneSec, (Timer timer) {
// //         if (_start < 420 ) {
// //           setState(() {
// //             print("this is timer 0 = ${_start.toString()}");
// //             percentValue.add(_start);
// //             _start++;
// //             selectedIndex = 1;
// //             SevenMinutesIncrement1();
// //           });
// //         } else if (_start1 < 420  ) {
// //           // percentValue.clear();
// //           setState(() {
// //             print("this is timer 1 =  ${_start1.toString()}");
// //             percentValue.add(_start1);
// //             _start1++;
// //             selectedIndex = 2;
// //             SevenMinutesIncrement2();
// //           });
// //         } else if (_start2 < 420) {
// //           setState(() {
// //             print("this is timer 2 =  ${_start2.toString()}");
// //             percentValue.add(_start2);
// //             _start2++;
// //             selectedIndex = 3;
// //             SevenMinutesIncrement3();
// //           });
// //         } else if (_start3 < 420) {
// //           setState(() {
// //             print("this is timer 3 = ${_start3.toString()}");
// //             percentValue.add(_start3);
// //             _start3++;
// //             selectedIndex = 4;
// //             SevenMinutesIncrement4();
// //           });
// //         } else if (_start4 < 420) {
// //           setState(() {
// //             print("this is timer 4 = ${_start4.toString()}");
// //             percentValue.add(_start4);
// //             _start4++;
// //             selectedIndex = 5;
// //             SevenMinutesIncrement5();
// //           });
// //         } else if (_start5 < 420) {
// //           setState(() {
// //             print("this is timer 5 = ${_start5.toString()}");
// //             percentValue.add(_start5);
// //             _start5++;
// //             selectedIndex = 6;
// //             SevenMinutesIncrement6();
// //           });
// //         } else {
// //           if (_start6 >= 420) {
// //             setState(() {
// //               selectedIndex = 7;
// //               SevenMinutesIncrement7();
// //               print("this is timer 6 = ${_start6.toString()}");
// //               print(" all tracks timer cancel ");
// //             });
// //           } else {
// //             setState(() {
// //               // timer.cancel();
// //               print(" else timer end ${_start6.toString()}");
// //               percentValue.add(_start6);
// //               _start6++;
// //             });
// //           }
// //         }
// //       },
// //     );
// //   }
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     // startTimer();
// //     // print('this is start timer method');
// //     super.initState();
// //   }
// // @override
// //   void dispose() {
// //     // TODO: implement dispose
// //   // _timer!.cancel();
// //   debugPrint('this is dispose method');
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     // print('trophy 1 = $trophy1');
// //     var timerValue = _start / 10;
// //     ///
// //     // var timerValue1 = _start1 / 420;
// //     var timerValue1 = _start1 / 10;
// //     ///
// //     var timerValue2 = _start2 / 10;
// //     ///
// //     var timerValue3 = _start3 / 10;
// //     ///
// //     var timerValue4 = _start4 / 10;
// //     ///
// //     var timerValue5 = _start5 / 10;
// //     ///
// //     var timerValue6 = _start6 / 60;
// //
// //     return Scaffold(
// //       backgroundColor: Color(0xFFEE616A),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             GestureDetector(
// //               onTap: (){
// //                 // Get.to(project_details());
// //                 final TimerTracksModel Data;
// //                 if(trophy1 == true){
// //                   if(trophy2 == true){
// //                     if(trophy3 == true){
// //                       if(trophy4 == true){
// //                         if(trophy5 == true){
// //                           if(trophy6 == true){
// //                             if(trophy7 == true){
// //                               Data = TimerTracksModel(count: 7);
// //                               var box = Boxes.getData2();
// //                               box.add(Data);
// //                               Data.save();
// //                               print(Data.toString());
// //                             }else{
// //                               Data = TimerTracksModel(count: 6);
// //                               var box = Boxes.getData2();
// //                               box.add(Data);
// //                               Data.save();
// //                               print(Data.toString());
// //                             }
// //                           }else{
// //                             Data = TimerTracksModel(count: 5);
// //                             var box = Boxes.getData2();
// //                             box.add(Data);
// //                             Data.save();
// //                             print(Data.toString());
// //                           }
// //                         }else{
// //                           Data = TimerTracksModel(count: 4);
// //                           var box = Boxes.getData2();
// //                           box.add(Data);
// //                           Data.save();
// //                           print(Data.toString());
// //                         }
// //                       }else{
// //                         Data = TimerTracksModel(count: 3);
// //                         var box = Boxes.getData2();
// //                         box.add(Data);
// //                         Data.save();
// //                         print(Data.toString());
// //                       }
// //                     }else{
// //
// //                       Data = TimerTracksModel(count: 2);
// //                       var box = Boxes.getData2();
// //                       box.add(Data);
// //                       Data.save();
// //                       print(Data.toString());
// //                       var maazdata = box.values.toList().cast<TimerTracksModel>();
// //                       for(int i = 0; i<maazdata.length; i++){
// //                         print('this is high value ${maazdata[i].count}');
// //                       }
// //                     }
// //
// //                   }else{
// //                     Data = TimerTracksModel(count: 1);
// //                     var box2 = Boxes.getData2();
// //                     box2.add(Data);
// //                     Data.save();
// //                     print(Data.count.toString());
// //                     var maazData2 = box2.values.toList().cast<TimerTracksModel>();
// //                     for(int i = 0; i<maazData2.length; i++){
// //                       print('this is high value ${maazData2[i].count}');
// //                     }
// //                   }
// //
// //                 }else{
// //                   print("please complete one step");
// //                 }
// //               },
// //               child: Padding(
// //                 padding:  EdgeInsets.only(left: 340.w, top:40.h),
// //                 child: Text(
// //                   'Save',
// //                   style: TextStyle(
// //                       fontSize: 25.sp,
// //                       color: Colors.white,
// //                       fontFamily: 'Tillana-Bold'),
// //                 ),
// //               ),
// //             ),
// //             /// 7 min win text
// //             Padding(
// //               padding:  EdgeInsets.only(left: 140.w,top: 0.h),
// //               child: Row(
// //                 children: [
// //                   Text(
// //                     '7',
// //                     style: TextStyle(
// //                         fontSize: 120.sp,
// //                         color: Colors.white,
// //                         fontFamily: 'Tillana-Bold'),
// //                   ),
// //                   SizedBox(width: 5,),
// //                   Column(
// //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         'min',
// //                         style: TextStyle(
// //                             fontSize: 40.sp,
// //                             color: Colors.white,
// //                             fontFamily: 'Tillana-Bold'),
// //                       ),
// //                       Text(
// //                         'win',
// //                         style: TextStyle(
// //                             fontSize: 40.sp,
// //                             color: Colors.white,
// //                             fontFamily: 'Tillana-Bold'),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             /// Timer
// //             CircularPercentIndicator(
// //               circularStrokeCap: CircularStrokeCap.round,
// //               arcBackgroundColor: Colors.white.withOpacity(.20),
// //               arcType: ArcType.FULL,
// //               radius: 140,
// //               animation: false,
// //               progressColor: Colors.white,
// //               lineWidth: 20.0,
// //               percent: selectedIndex == 1
// //                   ? timerValue
// //                   : selectedIndex == 2
// //                   ? timerValue1
// //                   : selectedIndex == 3
// //                   ? timerValue2
// //                   : selectedIndex == 4
// //                   ? timerValue3
// //                   : selectedIndex == 5
// //                   ? timerValue4
// //                   : selectedIndex == 6
// //                   ? timerValue5
// //                   : selectedIndex == 7
// //                   ? timerValue6 :timerValue6,
// //
// //               center: Padding(
// //                 padding: const EdgeInsets.only(top: 45),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                             selectedIndex == 1 ? minute1.toString()
// //                           : selectedIndex == 2 ? minute2.toString()
// //                           : selectedIndex == 3 ? minute3.toString()
// //                           : selectedIndex == 4 ? minute4.toString()
// //                           : selectedIndex == 5 ? minute5.toString()
// //                           : selectedIndex == 6 ? minute6.toString()
// //                           : selectedIndex == 7 ? minute7.toString()
// //                           : minute7.toString(),
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontFamily: 'RobotoMono-Bold',
// //                         fontSize: 130.0.sp,
// //                       ),
// //                     ),
// //                     SizedBox(height: 25.h),
// //                     ///seconds counts
// //                     Container(
// //                       height: 40,
// //                       width: 145,
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(width: 5.w, color: Color(0xFFEE616A),),
// //                         borderRadius: BorderRadius.circular(100.r),
// //                       ),
// //                       child: Center(
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Text(
// //                                     selectedIndex == 1 ? _start.toString()
// //                                   : selectedIndex == 2 ? _start1.toString()
// //                                   : selectedIndex == 3 ? _start2.toString()
// //                                   : selectedIndex == 4 ? _start3.toString()
// //                                   : selectedIndex == 5 ? _start4.toString()
// //                                   : selectedIndex == 6 ? _start5.toString()
// //                                   : selectedIndex == 7 ? _start6.toString()
// //                                   : _start6.toString(),
// //                               style: TextStyle(
// //                                 color: Color(0xFFEE616A),
// //                                 fontSize: 22.0.sp,
// //                               ),
// //                             ),
// //                             SizedBox(width: 5,),
// //                             Text('Seconds',
// //                               style: TextStyle(
// //                                 color: Color(0xFFEE616A),
// //                                 fontFamily: 'RobotoMono-Italic',
// //                                 fontSize: 20.sp,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             /// listview builder add tracks
// //             Container(
// //               height: 100.h,
// //               width: double.infinity,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: progressList.length,
// //                 itemBuilder: (context, index) {
// //                   TimerTracksModel data = progressList[index];
// //                   return selectedIndex == 1 ? index == 0 ?  custom_indicator(
// //                       trophy: trophy1,
// //                       index: index,
// //                       percent: timerValue,
// //                       colors: Colors.red
// //                   )
// //                       : custom_indicator(
// //                     trophy: trophy1,
// //                       index: index,
// //                     percent: timerValue,
// //                     colors: Colors.white
// //                    ): selectedIndex == 2 ? index == 1 ?  custom_indicator(
// //                       trophy: trophy1,
// //                       index: index,
// //                       percent: timerValue,
// //                       colors: Colors.red
// //                   ): custom_indicator(
// //                       trophy: trophy2,
// //                       index: index,
// //                       percent: timerValue1
// //                       ):
// //
// //                     selectedIndex == 3 ? index == 2 ?  custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ) : custom_indicator(
// //                       trophy: trophy3,
// //                         index: index,
// //                       percent: timerValue2
// //                      ):
// //
// //                     selectedIndex == 4 ? index == 3 ?  custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ) : custom_indicator(
// //                       trophy: trophy4,
// //                         index: index,
// //                       percent: timerValue3
// //                       ):
// //
// //                     selectedIndex == 5 ? index == 4 ?  custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ) : custom_indicator(
// //                       trophy: trophy5,
// //                         index: index,
// //                       percent: timerValue4
// //                           ):
// //
// //                     selectedIndex == 6 ? index == 5 ?  custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ): custom_indicator(
// //                       trophy: trophy6,
// //                         index: index,
// //                       percent: timerValue5
// //                     ):
// //
// //                     selectedIndex == 7 ? index == 6 ?  custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ) : custom_indicator(
// //                     trophy: trophy7,
// //                         index: index,
// //                       percent: timerValue6
// //                     ):
// //
// //                     selectedIndex == 8 ? index == 7 ? custom_indicator(
// //                         trophy: trophy1,
// //                         index: index,
// //                         percent: timerValue,
// //                         colors: Colors.red
// //                     ) : custom_indicator(
// //                         trophy: trophy7,
// //                         index: index,
// //                         percent: timerValue6,
// //                     ):
// //                     custom_indicator(
// //                      trophy: trophy7,
// //                       percent: index == 0
// //                           ? timerValue
// //                           : index == 1
// //                           ? timerValue1
// //                           : index == 2
// //                           ? timerValue2
// //                           : index == 3
// //                           ? timerValue3
// //                           : index == 4
// //                           ? timerValue4
// //                           : index == 5
// //                           ? timerValue5
// //                           : timerValue6,
// //                             data: index == 0
// //                           ? minute1.toString()
// //                           : index == 1
// //                           ? minute2.toString()
// //                           : index == 2
// //                           ? minute3.toString()
// //                           : index == 3
// //                           ? minute4.toString()
// //                           : index == 4
// //                           ? minute5.toString()
// //                           : index == 5
// //                           ? minute6.toString()
// //                           : minute7.toString(),);
// //                 },
// //               ),
// //             ),
// //             /// Buttons in Row
// //             SizedBox(height: 125.h,),
// //             Padding(
// //            //   padding: EdgeInsets.only(left: 20.w,top: 45.h,right: 120.w),
// //               padding: EdgeInsets.only(left: 20,right: 80,top: 12),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   GestureDetector(
// //                     onTap: () {
// //                       if (progressList.length < 7) {
// //                         setState(() {
// //                           progressList.add(TimerTracksModel(count: 0));
// //                           print(" Add data ${ progressList.length.toString()}");
// //                         });
// //                       }
// //                     },
// //                     child: Container(
// //                       height: 50.h,
// //                       width: 50.w,
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(50.r)),
// //                       child:  Icon(
// //                         Icons.add,
// //                         color: Color(0xFFEE616A),
// //                         size: 35.sp,
// //                       ),
// //                     ),
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       if (progressList.isNotEmpty) {
// //                         setState(() {
// //                           _timer!.isActive ? stop() : startTimer();
// //                           _togglePlayPause();
// //                         });
// //                       }
// //                     },
// //                     child: Container(
// //                       height: 50.h,
// //                       width: 150.w,
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(50.r)),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           _isPlaying
// //                               ? Icon(Icons.pause, color: Color(0xFFEE616A),size: 25.sp,)
// //                               : Icon(Icons.play_arrow, color: Color(0xFFEE616A),size: 25.sp,),
// //                           _isPlaying
// //                               ? Text('pause',style: TextStyle(color: Color(0xFFEE616A), fontFamily: 'RobotoMono-Regular', fontSize: 20.sp,),)
// //                               : Text('play',style: TextStyle(color: Color(0xFFEE616A), fontFamily: 'RobotoMono-Regular', fontSize: 20.0.sp,),)
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       if (progressList.length > 1) {
// //                         setState(() {
// //                          progressList.removeLast();
// //
// //                           print("Remove data ${ progressList.length.toString()}");
// //                         });
// //                       }
// //                     },
// //                     child: Container(
// //                       height: 50.h,
// //                       width: 50.w,
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(50.r)),
// //                       child:  Icon(
// //                         Icons.remove,
// //                         color: Color(0xFFEE616A),
// //                         size: 35.sp,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       /// floating action speed dial button
// //       floatingActionButton: SpeedDial(
// //         speedDialChildren: <SpeedDialChild>[
// //           SpeedDialChild(
// //             closeSpeedDialOnPressed: true,
// //             child: Icon(
// //                 Icons.domain_add_sharp,
// //               color: Color(0xFFEE616A),
// //             ),
// //             foregroundColor: Colors.black,
// //             backgroundColor: Colors.white,
// //             label: 'Add Data',
// //             onPressed: () {
// //               Get.to(DataScreen());
// //             },
// //           ),
// //           SpeedDialChild(
// //             closeSpeedDialOnPressed: true,
// //             child: const Icon(
// //               Icons.free_breakfast,
// //               color: Color(0xFFEE616A),
// //             ),
// //             foregroundColor: Colors.red,
// //             backgroundColor: Colors.white,
// //             label: 'Add Break',
// //             onPressed: () {
// //                 setState(() {
// //                   Get.to(breakScreen());
// //                 });
// //             },
// //           ),
// //           SpeedDialChild(
// //             closeSpeedDialOnPressed: false,
// //             child: Icon(Icons.history, color: Color(0xFFEE616A),),
// //             foregroundColor: Colors.black,
// //             backgroundColor: Colors.white,
// //             label: 'History',
// //             onPressed: () {
// //               Get.to(project_details());
// //             },
// //           ),
// //         ],
// //         labelsStyle: TextStyle(
// //             color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
// //         labelsBackgroundColor: Color(0xFFEE616A),
// //         closedForegroundColor: Colors.white,
// //         openForegroundColor: Color(0xFFEE616A),
// //         closedBackgroundColor: Color(0xFFEE616A),
// //         openBackgroundColor: Colors.white,
// //         child:Icon(Icons.more_vert,size: 50,),
// //       ),
// //     );
// //   }
// //   Widget custom_indicator({
// //     double ?percent,
// //     String? data,
// //     bool trophy = false,
// //     int? index,
// //     Color colors = Colors.orange
// // }) {
// //
// //     return Padding(
// //       padding: EdgeInsets.symmetric(horizontal: 8.w),
// //       child: CircularPercentIndicator(
// //         radius: 20.0,
// //         backgroundColor: colors,
// //         progressColor: Colors.white,
// //         lineWidth: 4.0,
// //          percent: percent!,
// //        // percent: 10.00,
// //         center:  trophy == true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,)
// //
// //         // trophy2 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,):
// //         // trophy3 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,):
// //         // trophy4 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,):
// //         // trophy5 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,):
// //         // trophy6 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,):
// //         // trophy7 ==true ? Icon(Icons.wine_bar_sharp,color: Colors.yellowAccent,)
// //
// //             : Text('0',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontFamily: 'RobotoMono-Regular',
// //             fontSize: 20.0.sp,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import '../../Models/TimerModel.dart';
// import 'custom indicator.dart';
//
// class practice extends StatefulWidget {
//   const practice({Key? key}) : super(key: key);
//
//   @override
//   State<practice> createState() => _practiceState();
// }
//
// class _practiceState extends State<practice> {
//   List<TimerTracksModel> progressList = [];
//
//   var selectedIndex = 0;
//   bool _isPlaying = false;
//   bool isTheme = false;
//
//   void _togglePlayPause() {
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }
//
//   Timer? _timer = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer1 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer2 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer3 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer4 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer5 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer6 = Timer(const Duration(seconds: 0), () {});
//   int _start =  0;
//   int _start1 = 0;
//   int _start2 = 0;
//   int _start3 = 0;
//   int _start4 = 0;
//   int _start5 = 0;
//   int _start6 = 0;
//
//   ///listview builder list
//   //  List<double> progressList = [];
//   int value = 0;
//   double progress = 0.0;
//
//   List<dynamic> percentValue = [];
//
//   void stop() {
//     if (_timer != null) {
//       setState(() {
//         _timer!.cancel();
//         _timer1!.cancel();
//         _timer2!.cancel();
//         _timer3!.cancel();
//         _timer4!.cancel();
//         _timer5!.cancel();
//         _timer6!.cancel();
//       });
//     }
//   }
//
//   /// minutes increment function = 1
//   var minute1 = 0;
//   bool trophy1 = false;
//   bool trophy2 = false;
//   bool trophy3 = false;
//   bool trophy4 = false;
//   bool trophy5 = false;
//   bool trophy6 = false;
//   bool trophy7 = false;
//
//   SevenMinutesIncrement1() {
//     setState(() {});
//     if (_start < 60) {
//       minute1 = 0;
//     } else if (_start >= 60 && _start < 120) {
//       minute1 = 1;
//       trophy1 = true;
//     } else if (_start >= 120 && _start < 180) {
//       minute1 = 2;
//       print('trophy 1 value = $trophy1');
//     } else if (_start >= 180 && _start < 240) {
//       minute1 = 3;
//     } else if (_start >= 240 && _start < 300) {
//       minute1 = 4;
//     } else if (_start >= 300 && _start < 360) {
//       minute1 = 5;
//     } else if (_start >= 360 && _start < 420) {
//       minute1 = 6;
//     } else if (_start == 420) {
//       minute1 = 7;
//       trophy1 = true;
//       print('trophy 1 value = $trophy1');
//     }
//   }
//
//   /// minutes increment function = 2
//   var minute2 = 0;
//
//   void SevenMinutesIncrement2() {
//     setState(() {});
//     if (_start1 < 60) {
//       minute2 = 0;
//     } else if (_start1 >= 60 && _start1 < 120) {
//       minute2 = 1;
//     } else if (_start1 >= 120 && _start1 < 180) {
//       print('trophy 2 value = $trophy2');
//       minute2 = 2;
//     } else if (_start1 >= 180 && _start1 < 240) {
//       trophy2 = true;
//       minute2 = 3;
//     } else if (_start1 >= 240 && _start1 < 300) {
//       minute2 = 4;
//     } else if (_start1 >= 300 && _start1 < 360) {
//       minute2 = 5;
//     } else if (_start1 >= 360 && _start1 < 420) {
//       minute2 = 6;
//     } else if (_start1 == 420) {
//       minute2 = 7;
//     }
//   }
//
//   /// minutes increment function = 3
//   var minute3 = 0;
//
//   void SevenMinutesIncrement3() {
//     setState(() {});
//     if (_start2 < 60) {
//       minute3 = 0;
//     } else if (_start2 >= 60 && _start2 < 120) {
//       minute3 = 1;
//     } else if (_start2 >= 120 && _start2 < 180) {
//       print('trophy 3 value = $trophy3');
//       minute3 = 2;
//     } else if (_start2 >= 180 && _start2 < 240) {
//       trophy3 = true;
//       minute3 = 3;
//     } else if (_start2 >= 240 && _start2 < 300) {
//       minute3 = 4;
//     } else if (_start2 >= 300 && _start2 < 360) {
//       minute3 = 5;
//     } else if (_start2 >= 360 && _start2 < 420) {
//       minute3 = 6;
//     } else if (_start2 == 420) {
//       minute3 = 7;
//     }
//   }
//
//   /// minutes increment function = 4
//   var minute4 = 0;
//
//   void SevenMinutesIncrement4() {
//     setState(() {});
//     if (_start3 < 60) {
//       minute4 = 0;
//     } else if (_start3 >= 60 && _start3 < 120) {
//       minute4 = 1;
//     } else if (_start3 >= 120 && _start3 < 180) {
//       minute4 = 2;
//       trophy4 = true;
//       print('trophy 4 value = $trophy4');
//     } else if (_start3 >= 180 && _start3 < 240) {
//       minute4 = 3;
//     } else if (_start3 >= 240 && _start3 < 300) {
//       minute4 = 4;
//     } else if (_start3 >= 300 && _start3 < 360) {
//       minute4 = 5;
//     } else if (_start3 >= 360 && _start3 < 420) {
//       minute4 = 6;
//     } else if (_start3 == 420) {
//       minute4 = 7;
//     }
//   }
//
//   /// minutes increment function = 5
//   var minute5 = 0;
//
//   void SevenMinutesIncrement5() {
//     setState(() {});
//     if (_start4 < 60) {
//       minute5 = 0;
//     } else if (_start4 >= 60 && _start4 < 120) {
//       minute5 = 1;
//     } else if (_start4 >= 120 && _start4 < 180) {
//       minute5 = 2;
//       trophy5 = true;
//       print('trophy 5 value = $trophy5');
//     } else if (_start4 >= 180 && _start4 < 240) {
//       minute5 = 3;
//     } else if (_start4 >= 240 && _start4 < 300) {
//       minute5 = 4;
//     } else if (_start4 >= 300 && _start4 < 360) {
//       minute5 = 5;
//     } else if (_start4 >= 360 && _start4 < 420) {
//       minute5 = 6;
//     } else if (_start4 == 420) {
//       minute5 = 7;
//     }
//   }
//
//   /// minutes increment function = 6
//   var minute6 = 0;
//
//   void SevenMinutesIncrement6() {
//     setState(() {});
//     if (_start5 < 60) {
//       minute6 = 0;
//     } else if (_start5 >= 60 && _start5 < 120) {
//       minute6 = 1;
//     } else if (_start5 >= 120 && _start5 < 180) {
//       minute6 = 2;
//       trophy6 = true;
//       print('trophy 6 value = $trophy6');
//     } else if (_start5 >= 180 && _start5 < 240) {
//       minute6 = 3;
//     } else if (_start5 >= 240 && _start5 < 300) {
//       minute6 = 4;
//     } else if (_start5 >= 300 && _start5 < 360) {
//       minute6 = 5;
//     } else if (_start5 >= 360 && _start5 < 420) {
//       minute6 = 6;
//     } else if (_start5 == 420) {
//       minute6 = 7;
//     }
//   }
//
//   /// minutes increment function = 7
//   var minute7 = 0;
//
//   void SevenMinutesIncrement7() {
//     setState(() {});
//     if (_start6 < 60) {
//       minute7 = 0;
//     } else if (_start6 >= 60 && _start6 < 120) {
//       minute7 = 1;
//     } else if (_start6 >= 120 && _start6 < 180) {
//       minute7 = 2;
//       trophy7 = true;
//       print('trophy 7 value = $trophy7');
//     } else if (_start6 >= 180 && _start6 < 240) {
//       minute7 = 3;
//     } else if (_start6 >= 240 && _start6 < 300) {
//       minute7 = 4;
//     } else if (_start6 >= 300 && _start6 < 360) {
//       minute7 = 5;
//     } else if (_start6 >= 360 && _start6 < 420) {
//       minute7 = 6;
//     } else if (_start6 == 420) {
//       minute7 = 7;
//     }
//   }
//
//   /// timer function
//   bool showIcon = false;
//
//
//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (Timer timer) {
//         if (_start < 10 && progressList.length > 0) {
//           setState(() {
//             print("this is timer 0 = ${_start.toString()}");
//             percentValue.add(_start);
//             _start++;
//             selectedIndex = 1;
//             SevenMinutesIncrement1();
//           });
//         } else if (_start1 < 20 && progressList.length > 1) {
//           setState(() {
//             print("this is timer 1 = ${_start1.toString()}");
//             percentValue.add(_start1);
//             _start1++;
//             selectedIndex = 2;
//             SevenMinutesIncrement2();
//           });
//         } else if (_start2 < 30 && progressList.length > 2) {
//           setState(() {
//             print("this is timer 2 = ${_start2.toString()}");
//             percentValue.add(_start2);
//             _start2++;
//             selectedIndex = 3;
//             SevenMinutesIncrement3();
//           });
//         } else if (_start3 < 40 && progressList.length > 3) {
//           setState(() {
//             print("this is timer 3 = ${_start3.toString()}");
//             percentValue.add(_start3);
//             _start3++;
//             selectedIndex = 4;
//             SevenMinutesIncrement4();
//           });
//         } else if (_start4 < 420 && progressList.length > 4) {
//           setState(() {
//             print("this is timer 4 = ${_start4.toString()}");
//             percentValue.add(_start4);
//             _start4++;
//             selectedIndex = 5;
//             SevenMinutesIncrement5();
//           });
//         } else if (_start5 < 420 && progressList.length > 5) {
//           setState(() {
//             print("this is timer 5 = ${_start5.toString()}");
//             percentValue.add(_start5);
//             _start5++;
//             selectedIndex = 6;
//             SevenMinutesIncrement6();
//           });
//         } else {
//           if (_start6 >= 420 || progressList.length > 6) {
//             setState(() {
//               selectedIndex = 7;
//               SevenMinutesIncrement7();
//               print("this is timer 6 = ${_start6.toString()}");
//               print("all tracks timer cancel");
//               timer.cancel(); // Stop the timer
//             });
//           } else {
//             setState(() {
//               print("else timer end ${_start6.toString()}");
//               percentValue.add(_start6);
//               _start6++;
//               if (_start6 >= 420) {
//                 selectedIndex = 7;
//                 SevenMinutesIncrement7();
//                 print("all tracks timer cancel");
//                 timer.cancel(); // Stop the timer
//               }
//             });
//           }
//         }
//       },
//     );
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     // startTimer();
//     // print('this is start timer method');
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     // _timer!.cancel();
//     debugPrint('this is dispose method');
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // print('trophy 1 = $trophy1');
//     void stopTimer() {
//       setState(() {
//         _timer?.cancel();
//         _isPlaying = false;
//       });
//       setState(() {
//
//       });
//     }
//
//     var timerValue = _start / 420;
//
//     ///
//     var timerValue1 = _start1 / 420;
//
//     ///
//     var timerValue2 = _start2 / 420;
//
//     ///
//     var timerValue3 = _start3 / 420;
//
//     ///
//     var timerValue4 = _start4 / 420;
//
//     ///
//     var timerValue5 = _start5 / 420;
//
//     ///
//     var timerValue6 = _start6 / 420;
//
//     return Scaffold(
//       backgroundColor:isTheme?  Colors.blue:Color(0xFFEE616A),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isTheme = true;
//                   print("$isTheme");
//                 });
//
//                 if (progressList.length < 7) {
//                   setState(() {
//                     progressList.add(TimerTracksModel(count: 0));
//                     print("Add data ${progressList.length.toString()}");
//                   });
//                 } else {
//                   setState(() {
//                     if (progressList.isNotEmpty) {
//                       _timer!.isActive ? stop() : startTimer();
//                       _togglePlayPause();
//                     }
//                   });
//                 }
//               },
//
//               // onTap: () {
//               //   Get.to(project_details());
//               //   final TimerTracksModel Data;
//               //   if (trophy1 == true) {
//               //     if (trophy2 == true) {
//               //       if (trophy3 == true) {
//               //         if (trophy4 == true) {
//               //           if (trophy5 == true) {
//               //             if (trophy6 == true) {
//               //               if (trophy7 == true) {
//               //                 Data = TimerTracksModel(count: 7);
//               //                 var box = Boxes.getData2();
//               //                 box.add(Data);
//               //                 Data.save();
//               //                 print(Data.toString());
//               //               } else {
//               //                 Data = TimerTracksModel(count: 6);
//               //                 var box = Boxes.getData2();
//               //                 box.add(Data);
//               //                 Data.save();
//               //                 print(Data.toString());
//               //               }
//               //             } else {
//               //               Data = TimerTracksModel(count: 5);
//               //               var box = Boxes.getData2();
//               //               box.add(Data);
//               //               Data.save();
//               //               print(Data.toString());
//               //             }
//               //           } else {
//               //             Data = TimerTracksModel(count: 4);
//               //             var box = Boxes.getData2();
//               //             box.add(Data);
//               //             Data.save();
//               //             print(Data.toString());
//               //           }
//               //         } else {
//               //           Data = TimerTracksModel(count: 3);
//               //           var box = Boxes.getData2();
//               //           box.add(Data);
//               //           Data.save();
//               //           print(Data.toString());
//               //         }
//               //       } else {
//               //         Data = TimerTracksModel(count: 2);
//               //         var box = Boxes.getData2();
//               //         box.add(Data);
//               //         Data.save();
//               //         print(Data.toString());
//               //         var maazdata =
//               //             box.values.toList().cast<TimerTracksModel>();
//               //         for (int i = 0; i < maazdata.length; i++) {
//               //           print('this is high value ${maazdata[i].count}');
//               //         }
//               //       }
//               //     } else {
//               //       Data = TimerTracksModel(count: 1);
//               //       var box2 = Boxes.getData2();
//               //       box2.add(Data);
//               //       Data.save();
//               //       print(Data.count.toString());
//               //       var maazData2 =
//               //           box2.values.toList().cast<TimerTracksModel>();
//               //       for (int i = 0; i < maazData2.length; i++) {
//               //         print('this is high value ${maazData2[i].count}');
//               //       }
//               //     }
//               //   } else {
//               //     print("please complete one step");
//               //   }
//               // },
//
//               child: Padding(
//                 padding: EdgeInsets.only(left: 340.w, top: 40.h),
//                 child: Text(
//                   'Save',
//                   style: TextStyle(
//                       fontSize: 25.sp,
//                       color: Colors.white,
//                       fontFamily: 'Tillana-Bold'),
//                 ),
//               ),
//             ),
//
//             /// 7 min win text
//             Padding(
//               padding: EdgeInsets.only(left: 140.w, top: 0.h),
//               child: Row(
//                 children: [
//                   Text(
//                     '7',
//                     style: TextStyle(
//                         fontSize: 120.sp,
//                         color: Colors.white,
//                         fontFamily: 'Tillana-Bold'),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'min',
//                         style: TextStyle(
//                             fontSize: 40.sp,
//                             color: Colors.white,
//                             fontFamily: 'Tillana-Bold'),
//                       ),
//                       Text(
//                         'win',
//                         style: TextStyle(
//                             fontSize: 40.sp,
//                             color: Colors.white,
//                             fontFamily: 'Tillana-Bold'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             /// Timer
//             SizedBox(height: 40.h,),
//             CircularPercentIndicator(
//               circularStrokeCap: CircularStrokeCap.round,
//               arcBackgroundColor: Colors.white.withOpacity(.20),
//               arcType: ArcType.FULL,
//               radius: 140,
//               animation: false,
//               progressColor: Colors.white,
//               lineWidth: 20.0,
//               percent: selectedIndex == 1
//                   ? timerValue
//                   : selectedIndex == 2
//                       ? timerValue1
//                       : selectedIndex == 3
//                           ? timerValue2
//                           : selectedIndex == 4
//                               ? timerValue3
//                               : selectedIndex == 5
//                                   ? timerValue4
//                                   : selectedIndex == 6
//                                       ? timerValue5
//                                       : selectedIndex == 7
//                                           ? timerValue6
//                                           : timerValue6,
//               center: Padding(
//                 padding: const EdgeInsets.only(top: 45),
//                 child: Column(
//                   children: [
//                     Text(
//                       selectedIndex == 1
//                           ? minute1.toString()
//                           : selectedIndex == 2
//                               ? minute2.toString()
//                               : selectedIndex == 3
//                                   ? minute3.toString()
//                                   : selectedIndex == 4
//                                       ? minute4.toString()
//                                       : selectedIndex == 5
//                                           ? minute5.toString()
//                                           : selectedIndex == 6
//                                               ? minute6.toString()
//                                               : selectedIndex == 7
//                                                   ? minute7.toString()
//                                                   : minute7.toString(),
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'RobotoMono-Bold',
//                         fontSize: 130.0.sp,
//                       ),
//                     ),
//                     SizedBox(height: 25.h),
//                     Container(
//                       height: 40,
//                       width: 145,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border:
//                             Border.all(width: 5.w, color: Color(0xFFEE616A)),
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               selectedIndex == 1
//                                   ? _start.toString()
//                                   : selectedIndex == 2
//                                       ? _start1.toString()
//                                       : selectedIndex == 3
//                                           ? _start2.toString()
//                                           : selectedIndex == 4
//                                               ? _start3.toString()
//                                               : selectedIndex == 5
//                                                   ? _start4.toString()
//                                                   : selectedIndex == 6
//                                                       ? _start5.toString()
//                                                       : selectedIndex == 7
//                                                           ? _start6.toString()
//                                                           : _start6.toString(),
//                               style: TextStyle(
//                                 color: Color(0xFFEE616A),
//                                 fontSize: 22.0.sp,
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Seconds',
//                               style: TextStyle(
//                                 color: Color(0xFFEE616A),
//                                 fontFamily: 'RobotoMono-Italic',
//                                 fontSize: 20.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             /// listview builder add tracks
//             SizedBox(
//               height: 100.h,
//               width: double.infinity,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: progressList.length,
//                 itemBuilder: (context, index) {
//                  // TimerTracksModel data = progressList[index];
//
//                   if (index == progressList.length + 0 && index + 1 == selectedIndex) {
//                     // Stop the timer here
//                     stopTimer();
//                     // setState(() {
//                     //
//                     // });
//                   }
//                   return selectedIndex == 1
//                       ? index == 0
//                           ? custom_indicator(
//                               color: Colors.blue,
//                               trophy: trophy1,
//                               percent: timerValue,
//                             )
//                           : custom_indicator(
//                               color: Colors.white,
//                               trophy: trophy1,
//                               percent: timerValue,
//                             )
//                       : selectedIndex == 2
//                           ? index == 1
//                               ? custom_indicator(
//                                   color: Colors.blue,
//                                   trophy: trophy2,
//                                   percent: timerValue1,
//                                 )
//                               : custom_indicator(
//                                   color: Colors.white,
//                                   trophy: trophy2,
//                                   percent: timerValue1,
//                                 )
//                           : selectedIndex == 3
//                               ? index == 2
//                                   ? custom_indicator(
//                                       color: Colors.blue,
//                                       trophy: trophy3,
//                                       percent: timerValue2,
//                                     )
//                                   : custom_indicator(
//                                       color: Colors.white,
//                                       trophy: trophy3,
//                                       percent: timerValue2,
//                                     )
//                               : selectedIndex == 4
//                                   ? index == 3
//                                       ? custom_indicator(
//                                           color: Colors.blue,
//                                           trophy: trophy4,
//                                           percent: timerValue3,
//                                         )
//                                       : custom_indicator(
//                                           trophy: trophy4,
//                                           color: Colors.white,
//                                           percent: timerValue3,
//                                         )
//                                   : selectedIndex == 5
//                                       ? index == 4
//                                           ? custom_indicator(
//                                               color: Colors.blue,
//                                               trophy: trophy5,
//                                               percent: timerValue4,
//                                             )
//                                           : custom_indicator(
//                                               trophy: trophy5,
//                                               color: Colors.white,
//                                               percent: timerValue4,
//                                             )
//                                       : selectedIndex == 6
//                                           ? index == 5
//                                               ? custom_indicator(
//                                                   color: Colors.blue,
//                                                   trophy: trophy6,
//                                                   percent: timerValue5,
//                                                 )
//                                               : custom_indicator(
//                                                   trophy: trophy6,
//                                                   color: Colors.white,
//                                                   percent: timerValue5,
//                                                 )
//                                           : selectedIndex == 7
//                                               ? index == 6
//                                                   ? custom_indicator(
//                                                       color: Colors.blue,
//                                                       trophy: trophy7,
//                                                       percent: timerValue6,
//                                                     )
//                                                   : custom_indicator(
//                                                       trophy: trophy7,
//                                                       color: Colors.white,
//                                                       percent: timerValue6,
//                                                     )
//                                               : selectedIndex == 8
//                                                   ? index == 7
//                                                       ? custom_indicator(
//                                                           color: Colors.blue,
//                                                           trophy: trophy2,
//                                                           percent: timerValue,
//                                                         )
//                                                       : custom_indicator(
//                                                           trophy: trophy7,
//                                                           color: Colors.white,
//                                                           percent: timerValue6,
//                                                         )
//                                                   : custom_indicator(
//                                                       color: Colors.white,
//                                                       trophy: trophy7,
//                                                       percent: index == 0
//                                                           ? timerValue
//                                                           : index == 1
//                                                               ? timerValue1
//                                                               : index == 2
//                                                                   ? timerValue2
//                                                                   : index == 3
//                                                                       ? timerValue3
//                                                                       : index ==
//                                                                               4
//                                                                           ? timerValue4
//                                                                           : index == 5
//                                                                               ? timerValue5
//                                                                               : timerValue6,
//                                                       data: index == 0
//                                                           ? minute1.toString()
//                                                           : index == 1
//                                                               ? minute2
//                                                                   .toString()
//                                                               : index == 2
//                                                                   ? minute3
//                                                                       .toString()
//                                                                   : index == 3
//                                                                       ? minute4
//                                                                           .toString()
//                                                                       : index ==
//                                                                               4
//                                                                           ? minute5
//                                                                               .toString()
//                                                                           : index == 5
//                                                                               ? minute6.toString()
//                                                                               : minute7.toString(),
//                                                     );
//                 },
//               ),
//             ),
//
//             /// Buttons in Row
//             SizedBox(
//               height: 125.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: 70),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       if (progressList.length < 7) {
//                         setState(() {
//                           progressList.add(TimerTracksModel(count: 0));
//                           print("Add data ${progressList.length.toString()}");
//                         });
//                       } else {
//                         setState(() {
//                           if (progressList.isNotEmpty) {
//                             _timer!.isActive ? stop() : startTimer();
//                             _togglePlayPause();
//                           }
//                         });
//                       }
//                     },
//                     child: Container(
//                       height: 50.h,
//                       width: 50.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(50.r),
//                       ),
//                       child: Icon(
//                         Icons.safety_check,
//                         color: Color(0xFFEE616A),
//                         size: 35.sp,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isTheme = true;
//                         print("$isTheme");
//                       });
//                       if (progressList.length < 7) {
//                         setState(() {
//                           progressList.add(TimerTracksModel(count: 0));
//                           print("Add data ${progressList.length.toString()}");
//                         });
//                       } else {
//                         setState(() {
//                           if (progressList.isNotEmpty) {
//                             _timer!.isActive ? stop() : startTimer();
//                             _togglePlayPause();
//                           }
//                         });
//                       }
//                     },
//                     child: Container(
//                       height: 50.h,
//                       width: 50.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(50.r),
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Color(0xFFEE616A),
//                         size: 35.sp,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (progressList.isNotEmpty) {
//                         setState(() {
//                           _timer!.isActive ? stop() : startTimer();
//                           _togglePlayPause();
//                         });
//                       }
//                     },
//                     child: Container(
//                       height: 50.h,
//                       width: 150.w,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(50.r)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _isPlaying
//                               ? Icon(
//                                   Icons.pause,
//                                   color: Color(0xFFEE616A),
//                                   size: 25.sp,
//                                 )
//                               : Icon(
//                                   Icons.play_arrow,
//                                   color: Color(0xFFEE616A),
//                                   size: 25.sp,
//                                 ),
//                           _isPlaying
//                               ? Text(
//                                   'pause',
//                                   style: TextStyle(
//                                     color: Color(0xFFEE616A),
//                                     fontFamily: 'RobotoMono-Regular',
//                                     fontSize: 20.sp,
//                                   ),
//                                 )
//                               : Text(
//                                   'play',
//                                   style: TextStyle(
//                                     color: Color(0xFFEE616A),
//                                     fontFamily: 'RobotoMono-Regular',
//                                     fontSize: 20.0.sp,
//                                   ),
//                                 )
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (progressList.length > 1) {
//                         setState(() {
//                           progressList.removeLast();
//
//                           print(
//                               "Remove data ${progressList.length.toString()}");
//                         });
//                       }
//                     },
//                     child: Container(
//                       height: 50.h,
//                       width: 50.w,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(50.r)),
//                       child: Icon(
//                         Icons.remove,
//                         color: Color(0xFFEE616A),
//                         size: 35.sp,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       /// floating action speed dial button
//       // floatingActionButton: SpeedDial(
//       //   speedDialChildren: <SpeedDialChild>[
//       //     SpeedDialChild(
//       //       closeSpeedDialOnPressed: true,
//       //       child: Icon(
//       //         Icons.domain_add_sharp,
//       //         color: Color(0xFFEE616A),
//       //       ),
//       //       foregroundColor: Colors.black,
//       //       backgroundColor: Colors.white,
//       //       label: 'Add Data',
//       //       onPressed: () {
//       //         //  Get.to(data());
//       //       },
//       //     ),
//       //     SpeedDialChild(
//       //       closeSpeedDialOnPressed: true,
//       //       child: const Icon(
//       //         Icons.free_breakfast,
//       //         color: Color(0xFFEE616A),
//       //       ),
//       //       foregroundColor: Colors.red,
//       //       backgroundColor: Colors.white,
//       //       label: 'Add Break',
//       //       onPressed: () {
//       //         setState(() {
//       //           Get.to(breakScreen());
//       //         });
//       //       },
//       //     ),
//       //     SpeedDialChild(
//       //       closeSpeedDialOnPressed: false,
//       //       child: Icon(
//       //         Icons.history,
//       //         color: Color(0xFFEE616A),
//       //       ),
//       //       foregroundColor: Colors.black,
//       //       backgroundColor: Colors.white,
//       //       label: 'History',
//       //       onPressed: () {
//       //         Get.to(project_details());
//       //       },
//       //     ),
//       //   ],
//       //   labelsStyle: TextStyle(
//       //       color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
//       //   labelsBackgroundColor: Color(0xFFEE616A),
//       //   closedForegroundColor: Colors.white,
//       //   openForegroundColor: Color(0xFFEE616A),
//       //   closedBackgroundColor: Color(0xFFEE616A),
//       //   openBackgroundColor: Colors.white,
//       //   child: Icon(
//       //     Icons.more_vert,
//       //     size: 50,
//       //   ),
//       // ),
//     );
//   }
//
// // int _progress = 0;
// }
// // SizedBox(
// // height: 100.h,
// // width: double.infinity,
// // child: ListView.builder(
// // scrollDirection: Axis.horizontal,
// // itemCount: progressList.length,
// // itemBuilder: (context, index) {
// // TimerTracksModel data = progressList[index];
// //
// // if (index == selectedIndex - 1) {
// // return custom_indicator(
// // color: Colors.blue,
// // trophy: trophyList[index],
// // percent: getTimerValue(index),
// // data: getMinuteValue(index),
// // );
// // } else {
// // return custom_indicator(
// // color: Colors.white,
// // trophy: trophyList[index],
// // percent: getTimerValue(index),
// // data: getMinuteValue(index),
// // );
// // }
// // },
// // ),
// // ),
