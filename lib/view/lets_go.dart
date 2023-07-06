import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/Add%20Details/Add%20data.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../Break Screen/Break.dart';
import '../Provider/Home Provider.dart';

class LetsGoScreen extends StatelessWidget {
  const LetsGoScreen({super.key});

  @override
  Widget build(BuildContext context) {
  //  print('build ');
    TimerProvider timerProvider = Provider.of<TimerProvider>(context,);
    //  print('Seconds are ${timerProvider.seconds}');
  //  timerProvider.resetTrophy();

    return Scaffold(
        backgroundColor: Color(0xFFEE616A),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 40.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    // GestureDetector(
                    //     onTap: (){
                    //     // Get.to(()=> data());
                    //       // timerProvider.isLock =! timerProvider.isLock;
                    //       // print(timerProvider.isLock);
                    //     },
                    //     child: Icon(Icons.lock_open,color: Colors

                    GestureDetector(
                        onTap: (){
                           timerProvider.removeAllIndicators();
                          // // Get.offNamed('/data');
                            timerProvider.isLock = true;
                           timerProvider.selectedIndex == 0;
                           timerProvider.resetTrophy();

                           Get.to(()=>data());
                         // Get.offAll(() => data());

                        },
                        child: Text('Save',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'Tillana-Bold'),))
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('7',style: TextStyle(fontSize: 120,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'Tillana-Bold'),),
                    SizedBox(width: 10,),

                    Column(
                      children: [
                        Text('min',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'Tillana-Bold'),),
                        Text('win',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'Tillana-Bold'),),

                      ],
                    ),

                  ],
                ),

                SizedBox(height: 40,),

                Container(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      TimerTracksModel data = TimerTracksModel(start: timerProvider.startValue, minute: 0); // Set timer for 7 minutes

                      int totalSeconds = data.minute * 60 + data.start;

                      double currentProgress = timerProvider.getCurrentProgress(totalSeconds);

                      if (!timerProvider.isPlaying || timerProvider.seconds >= totalSeconds) {
                        // Timer has completed or not playing, perform any required actions here
                        timerProvider.pauseTimer();
                        timerProvider.setSeconds(0); // Reset the timerValue
                        timerProvider.isPlaying = false; // Stop playing
                      }

                      int minutes = (timerProvider.seconds ~/ 60); // Calculate minutes based on timerValue
                      if (minutes < 0) {
                        minutes = 0;
                      }

                      return Container(
                        height: 100,
                        child: CircularPercentIndicator(
                          circularStrokeCap: CircularStrokeCap.round,
                          arcBackgroundColor: Colors.white.withOpacity(.20),
                          arcType: ArcType.FULL,
                          radius: 140,
                          animation: false,
                          progressColor: Colors.white,
                          lineWidth: 20.0,
                          percent: currentProgress,
                          center: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  minutes.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RobotoMono-Bold',
                                    fontSize: 130,
                                  ),
                                ),
                                SizedBox(height: 25),
                                 Container(
                                  height: 40,
                                  width: 145,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 5, color: Color(0xFFEE616A)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 5),
                                        Text(
                                          '${timerProvider.seconds}s / $totalSeconds',
                                          style: TextStyle(
                                            color: Color(0xFFEE616A),
                                            fontFamily: 'RobotoMono-Italic',
                                            fontSize: 20.0,
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
                      );
                    },
                  ),
                ),

                /// The null check Operator is here
                /// i think because the trophy and percent
                /// are not given

                Consumer<TimerProvider>(builder: (context,timerProvider,_){
                  return SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timerProvider.progressList.length,
                      itemBuilder: (context, index) {
                        int progressTotalSeconds = 60; // Set the total seconds to 60 for each indicator

                        timerProvider.updateProgress(index, progressTotalSeconds,);

                        double progressCurrentProgress = 0.0; // Default progress for previous indices
                        bool trophy = index <= timerProvider.selectedIndex; // Trophy is true for previous and current indices

                        if (index <= timerProvider.selectedIndex) {
                          // Calculate the elapsed time for the current index
                          int elapsedTime = timerProvider.seconds - (progressTotalSeconds * index);

                          // Calculate the progress for the current index
                          progressCurrentProgress = elapsedTime / progressTotalSeconds;
                          progressCurrentProgress = progressCurrentProgress.clamp(0.0, 1.0); // Clamp the value between 0.0 and 1.0
                        }

                        return SmallIndicator(
                          color: trophy ? Colors.amber : Colors.white,
                          percent: progressCurrentProgress,
                          trophy: trophy,
                        );
                      },
                    ),
                  );
                }),

                /// Add button
                /// Add button

              Container(
              width: 290,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=> breakScreen());
                       // timerProvider.isLock = false;
                        timerProvider.isPlaying = !timerProvider.isPlaying;
                        if (timerProvider.isPlaying) {
                          if (timerProvider.timer == null || !timerProvider.timer!.isActive) {
                            timerProvider.startTimer();
                          }
                        } else {
                          timerProvider.pauseTimer();
                        }

                      },
                      child: Icon(Icons.free_breakfast,color: Colors.white,size: 25,)),

                  SizedBox(width: 20,),
                  timerProvider.isLock?
                  GestureDetector(
                    onTap: (){
                      timerProvider.addIndicator();
                    },
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFEE616A),
                      ),
                    ),
                  ):
                  SizedBox(width: 38,),
                  SizedBox(width: 20,),

                  Consumer<TimerProvider>(
                    builder: (context, timerProvider, _) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {

                            timerProvider.togglePlayPause();
                            timerProvider.isLock = false;
                            print('${timerProvider.isPlaying}');

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(timerProvider.isPlaying ? Icons.pause : Icons.play_arrow,color: Color(0xFFEE616A),),
                              Text(
                                "Play",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFEE616A),
                                  fontFamily: 'RobotoMono-Bold',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      },
                  ),

                  SizedBox(width: 20,),
                  timerProvider.isLock?
                  GestureDetector(
                    onTap: (){
                      timerProvider.removeIndicator();
                    },
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFFEE616A),
                      ),
                    ),
                  ):
                  SizedBox(),

                ],
              ),
            ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),

        // floatingActionButton: SpeedDial(
        //   speedDialChildren: <SpeedDialChild>[
        //     SpeedDialChild(
        //       closeSpeedDialOnPressed: true,
        //       child: Icon(
        //         Icons.domain_add_sharp,
        //         color: Color(0xFFEE616A),
        //       ),
        //       foregroundColor: Colors.black,
        //       backgroundColor: Colors.white,
        //       label: 'Add Data',
        //       onPressed: () {
        //         //  Get.to(data());
        //       },
        //     ),
        //     SpeedDialChild(
        //       closeSpeedDialOnPressed: true,
        //       child: const Icon(
        //         Icons.free_breakfast,
        //         color: Color(0xFFEE616A),
        //       ),
        //       foregroundColor: Colors.red,
        //       backgroundColor: Colors.white,
        //       label: 'Add Break',
        //       onPressed: () {
        //         setState(() {
        //           Get.to(breakScreen());
        //         });
        //       },
        //     ),
        //     SpeedDialChild(
        //       closeSpeedDialOnPressed: false,
        //       child: Icon(
        //         Icons.history,
        //         color: Color(0xFFEE616A),
        //       ),
        //       foregroundColor: Colors.black,
        //       backgroundColor: Colors.white,
        //       label: 'History',
        //       onPressed: () {
        //         Get.to(project_details());
        //       },
        //     ),
        //   ],
        //   labelsStyle: TextStyle(
        //       color: Colors.white, fontFamily: 'Tillana-Bold', fontSize: 15.sp),
        //   labelsBackgroundColor: Color(0xFFEE616A),
        //   closedForegroundColor: Colors.white,
        //   openForegroundColor: Color(0xFFEE616A),
        //   closedBackgroundColor: Color(0xFFEE616A),
        //   openBackgroundColor: Colors.white,
        //   child: Icon(
        //     Icons.more_vert,
        //     size: 50,
        //   ),
        // ),

      );
  }
}

class SmallIndicator extends StatelessWidget {

  double percent;
  Color color ;
  bool trophy ;
  SmallIndicator({super.key,required this.color,required this.percent,required this.trophy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CircularPercentIndicator(
        radius: 20.0,
        backgroundColor: color,
        progressColor: Colors.white,
        lineWidth: 6.0,
        percent: percent,
        center: trophy
            ? Icon(
          Icons.wine_bar_sharp,
          color: Colors.yellowAccent,
        )
            : SizedBox(), // Hide the center if data is null
      ),
    );
  }
}

// Widget smallIndicator(
//     {
//       double ?percent,
//       Color ?color,
//       bool ?trophy = false,
//     }
//     ){
//   return
//     Padding(
//     padding: EdgeInsets.symmetric(horizontal: 8.w),
//     child: CircularPercentIndicator(
//       radius: 20.0,
//       backgroundColor: color!,
//       progressColor: Colors.white,
//       lineWidth: 6.0,
//       percent: percent!,
//       center: trophy!
//           ? Icon(
//         Icons.wine_bar_sharp,
//         color: Colors.yellowAccent,
//       )
//           : SizedBox(), // Hide the center if data is null
//     ),
//   );


/// Model
class TimerTracksModel {
  int start;
  int minute;
  bool trophy;
  TimerTracksModel({required this.start, required this.minute, this.trophy = false});
}