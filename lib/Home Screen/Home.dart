// import 'dart:async';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:provider/provider.dart';
// import 'package:seven_min_track/Pracitce/custom%20indicator.dart';
// import 'package:seven_min_track/Provider/Home%20Provider.dart';
// import 'package:seven_min_track/Provider/Home%20Provider.dart';
// import 'package:simple_speed_dial/simple_speed_dial.dart';
// import '../Provider/Home Provider.dart';
// import '../Provider/Home Provider.dart';

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   home_provider prov = home_provider();
//
//   @override
//   Widget build(BuildContext context) {
//
//     var timerValue1 = prov.start1 / 420;
//     var timerValue2 = prov.start2 / 420;
//     var timerValue3 = prov.start3 / 420;
//     var timerValue4 = prov.start4 / 420;
//     var timerValue5 = prov.start5 / 420;
//     var timerValue6 = prov.start6 / 420;
//     var timerValue7 = prov.start7 / 420;
//
//     return Scaffold(
//       backgroundColor: Colors.deepOrange,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.deepOrange,
//         title: Center(
//           child: Text(
//             '7 mins Track',
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 color: Colors.white,
//                 fontFamily: 'Tillana-Bold'),
//           ),
//         ),
//       ),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ///
//           Consumer<home_provider>(builder: (context, home_provider, child) {
//             return CircularPercentIndicator(
//               radius: 150,
//               backgroundColor: Colors.white,
//               progressColor: Colors.green,
//               lineWidth: 20.0,
//               percent:
//               home_provider.selectedIndex == 1
//                   ? timerValue1
//                   : home_provider.selectedIndex == 2
//                       ? timerValue2
//                       : home_provider.selectedIndex == 3
//                           ? timerValue3
//                           : home_provider.selectedIndex == 4
//                               ? timerValue4
//                               : home_provider.selectedIndex == 5
//                                   ? timerValue5
//                                   : home_provider.selectedIndex == 6
//                                       ? timerValue6
//                                       : home_provider.selectedIndex == 7
//                                           ? timerValue7
//                                           : timerValue7,
//               center: Text(
//                 home_provider.selectedIndex == 1
//                     ? home_provider.minute1.toString()
//                     : home_provider.selectedIndex == 2
//                         ? home_provider.minute2.toString()
//                         : home_provider.selectedIndex == 3
//                             ? home_provider.minute3.toString()
//                             : home_provider.selectedIndex == 4
//                                 ? home_provider.minute4.toString()
//                                 : home_provider.selectedIndex == 5
//                                     ? home_provider.minute5.toString()
//                                     : home_provider.selectedIndex == 6
//                                         ? home_provider.minute6.toString()
//                                         : home_provider.selectedIndex == 7
//                                             ? home_provider.minute7.toString()
//                                             : home_provider.minute7.toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Tillana-Regular',
//                   fontSize: 90.0.sp,
//                 ),
//               ),
//             );
//           }),
//
//           Consumer<home_provider>(builder: (context, home_provider, child) {
//             return Padding(
//               padding: EdgeInsets.only(right: 15.w),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(width: 5.w, color: Colors.deepOrange),
//                     borderRadius: BorderRadius.circular(100.r),
//                   ),
//                   child: Center(
//                     child: Text(
//                       home_provider.selectedIndex == 1
//                           ? home_provider.start1.toString()
//                           : home_provider.selectedIndex == 2
//                               ? home_provider.start2.toString()
//                               : home_provider.selectedIndex == 3
//                                   ? home_provider.start3.toString()
//                                   : home_provider.selectedIndex == 4
//                                       ? home_provider.start4.toString()
//                                       : home_provider.selectedIndex == 5
//                                           ? home_provider.start5.toString()
//                                           : home_provider.selectedIndex == 6
//                                               ? home_provider.start6.toString()
//                                               : home_provider.selectedIndex == 7
//                                                   ? home_provider.start7
//                                                       .toString()
//                                                   : home_provider.progress
//                                                       .toString(),
//                       style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontFamily: 'Tillana-Bold',
//                         fontSize: 40.0.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//
//           ///
//           Consumer<home_provider>(builder: (context, home_provider, child) {
//             return SizedBox(
//               height: 220.h,
//               width: double.infinity,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: home_provider.progressList.length,
//                 itemBuilder: (context, index) {
//                   int progress = home_provider.progressList[index];
//                   return home_provider.selectedIndex == 1 ? index == 0 ? SizedBox(width: 50.w) : custom_indicator(
//                     percent: index == 0
//                       ? timerValue1
//                       : index == 1
//                       ? timerValue2
//                       : index == 2
//                       ? timerValue3
//                       : index == 3
//                       ? timerValue4
//                       : index == 4
//                       ? timerValue5
//                       : index == 5
//                       ? timerValue6
//                       : timerValue7,
//                     data: index == 0
//                         ? home_provider.minute1.toString()
//                         : index == 1
//                         ? home_provider. minute2.toString()
//                         : index == 2
//                         ? home_provider.minute3.toString()
//                         : index == 3
//                         ? home_provider.minute4.toString()
//                         : index == 4
//                         ? home_provider.minute5.toString()
//                         : index == 5
//                         ? home_provider.minute6.toString()
//                         : home_provider.minute7.toString(),):
//
//                   home_provider.selectedIndex == 2 ? index == 1 ? SizedBox(width: 45.w,) : custom_indicator(
//                     percent: index == 0
//                         ? timerValue1
//                         : index == 1
//                         ? timerValue2
//                         : index == 2
//                         ? timerValue3
//                         : index == 3
//                         ? timerValue4
//                         : index == 4
//                         ? timerValue5
//                         : index == 5
//                         ? timerValue6
//                         : timerValue7,
//                     data: index == 0
//                         ? home_provider.minute1.toString()
//                         : index == 1
//                         ? home_provider.minute2.toString()
//                         : index == 2
//                         ? home_provider.minute3.toString()
//                         : index == 3
//                         ? home_provider.minute4.toString()
//                         : index == 4
//                         ? home_provider.minute5.toString()
//                         : index == 5
//                         ? home_provider.minute6.toString()
//                         : home_provider.minute7.toString(),):
//
//                   home_provider.selectedIndex == 3 ? index == 2 ? SizedBox(width: 45.w,) : custom_indicator(
//                     percent: index == 0
//                         ? timerValue1
//                         : index == 1
//                         ? timerValue2
//                         : index == 2
//                         ? timerValue3
//                         : index == 3
//                         ? timerValue4
//                         : index == 4
//                         ? timerValue5
//                         : index == 5
//                         ? timerValue6
//                         : timerValue7,
//                     data: index == 0
//                         ? home_provider.minute1.toString()
//                         : index == 1
//                         ? home_provider.minute2.toString()
//                         : index == 2
//                         ? home_provider.minute3.toString()
//                         : index == 3
//                         ? home_provider.minute4.toString()
//                         : index == 4
//                         ? home_provider.minute5.toString()
//                         : index == 5
//                         ? home_provider.minute6.toString()
//                         : home_provider.minute7.toString(),):
//
//                   // home_provider.selectedIndex == 4 ? index == 3 ? SizedBox(width: 45.w,) : custom_indicator(
//                   //   percent: index == 0
//                   //       ? timerValue
//                   //       : index == 1
//                   //       ? timerValue1
//                   //       : index == 2
//                   //       ? timerValue2
//                   //       : index == 3
//                   //       ? timerValue3
//                   //       : index == 4
//                   //       ? timerValue4
//                   //       : index == 5
//                   //       ? timerValue5
//                   //       : timerValue6,
//                   //   data: index == 0
//                   //       ? minute1.toString()
//                   //       : index == 1
//                   //       ? minute2.toString()
//                   //       : index == 2
//                   //       ? minute3.toString()
//                   //       : index == 3
//                   //       ? minute4.toString()
//                   //       : index == 4
//                   //       ? minute5.toString()
//                   //       : index == 5
//                   //       ? minute6.toString()
//                   //       : _start6.toString(),):
//                   //
//                   // selectedIndex == 5 ? index == 4 ? SizedBox(width: 45.w,) : custom_indicator(
//                   //   percent: index == 0
//                   //       ? timerValue
//                   //       : index == 1
//                   //       ? timerValue1
//                   //       : index == 2
//                   //       ? timerValue2
//                   //       : index == 3
//                   //       ? timerValue3
//                   //       : index == 4
//                   //       ? timerValue4
//                   //       : index == 5
//                   //       ? timerValue5
//                   //       : timerValue6,
//                   //   data: index == 0
//                   //       ? minute1.toString()
//                   //       : index == 1
//                   //       ? minute2.toString()
//                   //       : index == 2
//                   //       ? minute3.toString()
//                   //       : index == 3
//                   //       ? minute4.toString()
//                   //       : index == 4
//                   //       ? minute5.toString()
//                   //       : index == 5
//                   //       ? minute6.toString()
//                   //       : _start6.toString(),):
//                   //
//                   // selectedIndex == 6 ? index == 5 ? SizedBox(width: 45.w,) : custom_indicator(
//                   //   percent: index == 0
//                   //       ? timerValue
//                   //       : index == 1
//                   //       ? timerValue1
//                   //       : index == 2
//                   //       ? timerValue2
//                   //       : index == 3
//                   //       ? timerValue3
//                   //       : index == 4
//                   //       ? timerValue4
//                   //       : index == 5
//                   //       ? timerValue5
//                   //       : index == 6
//                   //       ? timerValue6
//                   //       : timerValue6,
//                   //   data: index == 0
//                   //       ? minute1.toString()
//                   //       : index == 1
//                   //       ? minute2.toString()
//                   //       : index == 2
//                   //       ? minute3.toString()
//                   //       : index == 3
//                   //       ? minute4.toString()
//                   //       : index == 4
//                   //       ? minute5.toString()
//                   //       : index == 5
//                   //       ? minute6.toString()
//                   //       : minute7.toString(),):
//
//                   // selectedIndex == 7 ? index == 6 ? SizedBox(width: 45.w,) : custom_indicator(
//                   //   percent: index == 0
//                   //       ? timerValue
//                   //       : index == 1
//                   //       ? timerValue1
//                   //       : index == 2
//                   //       ? timerValue2
//                   //       : index == 3
//                   //       ? timerValue3
//                   //       : index == 4
//                   //       ? timerValue4
//                   //       : index == 5
//                   //       ? timerValue5
//                   //       : index == 6
//                   //       ? timerValue6
//                   //   : timerValue6,
//                   //   data: index == 0
//                   //       ? minute1.toString()
//                   //       : index == 1
//                   //       ? minute2.toString()
//                   //       : index == 2
//                   //       ? minute3.toString()
//                   //       : index == 3
//                   //       ? minute4.toString()
//                   //       : index == 4
//                   //       ? minute5.toString()
//                   //       : index == 5
//                   //       ? minute6.toString()
//                   //       : minute7.toString(),):
//
//                   custom_indicator(
//                     percent: index == 0
//                         ? timerValue1
//                         : index == 1
//                         ? timerValue2
//                         : index == 2
//                         ? timerValue3
//                         : index == 3
//                         ? timerValue4
//                         : index == 4
//                         ? timerValue5
//                         : index == 5
//                         ? timerValue5
//                         : timerValue7,
//                     data: index == 0
//                         ? home_provider.minute1.toString()
//                         : index == 1
//                         ? home_provider.minute2.toString()
//                         : index == 2
//                         ? home_provider.minute3.toString()
//                         : index == 3
//                         ? home_provider.minute4.toString()
//                         : index == 4
//                         ? home_provider.minute5.toString()
//                         : index == 5
//                         ? home_provider.minute6.toString()
//                         : home_provider.minute7.toString(),);
//                 },
//               ),
//             );
//           }),
//
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 100.w),
//             child: Consumer<home_provider>(
//               builder: (context, home_provider, child) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         home_provider.addTrack(0);
//                       },
//                       child: Container(
//                         height: 35.h,
//                         width: 35.w,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(50.r)),
//                         child: const Icon(
//                           Icons.add,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         home_provider.togglePlayPause();
//                         // if (progressList.isNotEmpty) {
//                         //   home_provider.togglePlayPause();
//                         //   setState(() {
//                         //     _timer!.isActive ? stop() : startTimer();
//                         //   });
//                         // }
//                       },
//                       child: Container(
//                         height: 35.h,
//                         width: 35.w,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(50.r)),
//                         child: home_provider.isPlaying
//                             ? Icon(
//                                 Icons.pause,
//                                 color: Colors.deepOrange,
//                               )
//                             : Icon(Icons.play_arrow, color: Colors.deepOrange),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         home_provider.removeTrack(0);
//                       },
//                       child: Container(
//                         height: 35.h,
//                         width: 35.w,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(50.r)),
//                         child: const Icon(
//                           Icons.remove,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//
//       /// floating action speed dial button
//       floatingActionButton:
//           Consumer<home_provider>(builder: (context, home_provider, child) {
//         return SpeedDial(
//           speedDialChildren: <SpeedDialChild>[
//             SpeedDialChild(
//               closeSpeedDialOnPressed: false,
//               child: const Icon(
//                 Icons.remove,
//                 color: Colors.black,
//               ),
//               foregroundColor: Colors.black,
//               backgroundColor: Colors.white,
//               label: 'Remove Track',
//               onPressed: () {
//                 home_provider.removeTrack(0);
//               },
//             ),
//             SpeedDialChild(
//               closeSpeedDialOnPressed: false,
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.black,
//               ),
//               foregroundColor: Colors.red,
//               backgroundColor: Colors.white,
//               label: 'Add Track',
//               onPressed: () {
//                 home_provider.addTrack(0);
//               },
//             ),
//             SpeedDialChild(
//               closeSpeedDialOnPressed: false,
//               child: home_provider.isPlaying
//                   ? Icon(Icons.pause)
//                   : Icon(Icons.play_arrow),
//               foregroundColor: Colors.red,
//               backgroundColor: Colors.white,
//               label: home_provider.isPlaying ? 'Pause' : 'Play',
//               onPressed: () {
//                 home_provider.togglePlayPause();
//                 // if (progressList.isNotEmpty) {
//                 //
//                 //   setState(() {
//                 //     _timer!.isActive ? stop() : startTimer();
//                 //   });
//                 // }
//               },
//             ),
//           ],
//           labelsStyle: TextStyle(
//               color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
//           labelsBackgroundColor: Colors.deepOrange,
//           closedForegroundColor: Colors.white,
//           openForegroundColor: Colors.black,
//           closedBackgroundColor: Colors.deepOrange,
//           openBackgroundColor: Colors.white,
//           child: Text(
//             'Add',
//             style: TextStyle(fontFamily: 'Tillana-Bold', fontSize: 20.sp),
//           ),
//         );
//       }),
//     );
//   }
//
//   int _progress = 0;
// }
