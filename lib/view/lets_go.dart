import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';
import '../Provider/Home Provider.dart';
import '../utils/app_colors.dart';
import 'Break Screen/Break.dart';
import 'hidve_database/create_project.dart';
import 'hidve_database/date_model.dart';
import 'hidve_database/existing_data.dart';

class LetsGoScreen extends StatefulWidget {
  String title;
  String description;
  bool type;

  LetsGoScreen(this.title, this.description, this.type, {Key? key})
      : super(key: key);

  @override
  State<LetsGoScreen> createState() => _LetsGoScreenState();
}

class _LetsGoScreenState extends State<LetsGoScreen> {
//  const LetsGoScreen({super.key});

  String projectBoxName = 'projects';
  String projectBoxNames = 'dateBox';

  late Box<Project> box; // Declare the box variable
  late Box<DateModel> boxx; // Declare the box variable

  Future<void> openHiveBox() async {
    box = await Hive.openBox<Project>('projects');
    boxx = await Hive.openBox<DateModel>('dateBox');
  }

  TimerProvider timer = TimerProvider();

  void initState() {
    super.initState();
    print('removed');

    box = Hive.box<Project>(projectBoxName); // Initialize the box variable
    boxx = Hive.box<DateModel>('dateBox'); // Initialize the box variable
    openHiveBox();
  }


  Future<void> saveDate() async {
    final box = await Hive.openBox<DateModel>('dateBox'); // Open the Hive box

    DateModel lastData;

    if (box.isNotEmpty) {
      lastData = box.getAt(box.length - 1)!; // Use the non-nullable assertion operator (!)
    } else {
      lastData = DateModel(DateTime.now(), 0);
    }

    DateTime currentDate = DateTime.now();
    int updatedIndex = lastData.currentIndex;

    if (lastData.date.year != currentDate.year ||
        lastData.date.month != currentDate.month ||
        lastData.date.day != currentDate.day) {
      updatedIndex++; // Increment index for different dates
    }

    final newData = DateModel(currentDate, updatedIndex);
    box.add(newData);

    print('Data successfully added:');
    print('Date: ${newData.date}');
    print('Updated Index: ${newData.currentIndex}');
  }



  Future<void> saveExistingData(int seconds, int minutes) async {
    DateTime currentTime = DateTime.now(); // Get the current time

    final dataa = DataModel(
      minutes: minutes,
      seconds: seconds,
      date: DateTime.now(),
      // Use the current date
      startTime: currentTime,
      endTime: currentTime,
    );

    final box = await Hive.openBox<DataModel>('dataBox'); // Open the Hive box

    box.add(dataa); // Add the data to the box
    print('Saved');
  }

  @override
  Widget build(BuildContext context) {
    print('build ');
    TimerProvider timerProvider =
        Provider.of<TimerProvider>(context, listen: false);

    ///build method is calling every second and showing issue of setState() or markNeedsBuild() called during build.
    /// because of TimerProvider timerProvider = Provider.of<TimerProvider>(context,listen: true); make listen false ok.

    // print('Removed Indicators are ${  timerProvider.removeAllIndicators}');
    // timerProvider.resetTrophy();
    // timerProvider.removeAllIndicators();

    return Scaffold(

      // backgroundColor: Color(0xffFCD51A),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.blue, AppColors.lightgreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                      height: 30.h,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: customTextRegular(title: widget.title,color: AppColors.blackColor),

                    ),

                    GestureDetector(
                      onTap: () async {
                        if (widget.type == false) {
                          saveDate();
                          saveExistingData(timerProvider.minutes, timerProvider.seconds).then((data) {
                            timerProvider.removeAllIndicators();
                            timerProvider.isLock = true;
                            timerProvider.selectedIndex == 0;
                            timerProvider.resetTrophy();

                            print('jabbar ${timerProvider.seconds}');
                          }).catchError((error) {
                            print('Error fetching data: $error');
                          });
                        } else {
                          saveData(timerProvider.seconds, timerProvider.minutes)
                              .then((data) {
                            print("${timerProvider.minutes}");
                            // print('Data fetched: $data');
                            //  process(data);
                            timerProvider.removeAllIndicators();
                            // timerProvider.isLock = true;
                            timerProvider.selectedIndex == 0;
                            timerProvider.resetTrophy();
                          }).catchError((error) {
                            print('Error fetching data: $error');
                          });
                        }

                         saveDate();
                        Get.to(() => HomeScreen());
                        print('seconds is ${timerProvider.seconds}');
                      },
                      child: SvgPicture.asset(
                        "assets/icons/download-square_svgrepo.com.svg",
                      ),
                      // Text("Save",style: GoogleFonts.avan(textStyle:TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white, ),)
                      //Text('Save',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white,fontFamily: 'Tillana-Bold'),)),
                      //   Text("Save",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'AvenirLTStd-Roman' ))
                    ),
                  ],
                ),

                //  Text(timerProvider.seconds.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'AvenirLTStd-Roman' ),),

                SizedBox(
                  height: 70.h,
                ),

                Consumer<TimerProvider>(builder: (context, _, timer) {
                  return Container(
                    // color: Colors.red,
                    height: 340.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        TimerTracksModel data = TimerTracksModel(
                            start: timerProvider.startValue,
                            minute: 0); // Set timer for 7 minutes

                        int totalSeconds = data.minute * 60 + data.start;

                        double currentProgress =
                            timerProvider.getCurrentProgress(totalSeconds);

                        if (!timerProvider.isPlaying ||
                            timerProvider.seconds >= totalSeconds) {
                          // Timer has completed or not playing, perform any required actions here
                          timerProvider.pauseTimer();
                          //  timerProvider.setSeconds(0); // Reset the timerValue
                          timerProvider.isPlaying = false; // Stop playing
                        }

                        int minutes = (timerProvider.seconds ~/
                            60); // Calculate minutes based on timerValue
                        if (minutes < 0) {
                          minutes = 0;
                        }
                        timerProvider.updateMinutes(minutes);

                        return CircularPercentIndicator(
                          circularStrokeCap: CircularStrokeCap.round,
                          arcBackgroundColor: Colors.white.withOpacity(.20),
                          arcType: ArcType.FULL,
                          radius: 140,
                          animation: false,
                          progressColor: Colors.white,
                          lineWidth: 8.0,
                          percent: currentProgress,
                          center: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Consumer<TimerProvider>(
                                builder: (context, _, TimerProvider) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    minutes.toString(),
                                    style: TextStyle(
                                        fontSize: 120,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'AvenirLTStd-Roman'),
                                  ),
                                  SizedBox(height: 44),
                                  Hero(
                                    tag: 'lets_start_button',
                                    child: Container(
                                      height: 40,
                                      width: 145,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // gradient: LinearGradient(
                                        //   colors: [Color(0xff7ef29d ), Color(0xffFBC40F)],
                                        //   begin: Alignment.topLeft,
                                        //   end: Alignment.bottomRight,
                                        // ),

                                        border: Border.all(
                                            width: 5, color: AppColors.white),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 5),
                                            Text(
                                              '${timerProvider.seconds}s / ${totalSeconds}s',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily: 'AvenirLTStd-Roman',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  );
                }),

                /// The null check Operator is here
                /// i think because the trophy and percent
                /// are not given

                SizedBox(
                  height: 76.h,
                ),
                Consumer<TimerProvider>(builder: (context, _, timer) {
                  return SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                        timerProvider.progressList.length > 0
                            ? timerProvider.progressList.length
                            : 1, // Check if progressList is empty
                        (index) {
                          int progressTotalSeconds =
                              60; // Set the total seconds to 60 for each indicator

                          timerProvider.updateProgress(
                              index, progressTotalSeconds);

                          double progressCurrentProgress =
                              0.0; // Default progress for previous indices
                          bool trophy = index <=
                              timerProvider
                                  .selectedIndex; // Trophy is true for previous and current indices

                          if (index <= timerProvider.selectedIndex) {
                            // Calculate the elapsed time for the current index
                            int elapsedTime = timerProvider.seconds -
                                (progressTotalSeconds * index);

                            // Calculate the progress for the current index
                            progressCurrentProgress =
                                elapsedTime / progressTotalSeconds;
                            progressCurrentProgress =
                                progressCurrentProgress.clamp(0.0,
                                    1.0); // Clamp the value between 0.0 and 1.0
                          }

                          return SmallIndicator(
                            //color: trophy ? Colors.amber : Colors.white,
                            percent: progressCurrentProgress,
                            trophy: trophy,
                          );
                        },
                      ),
                    ),
                  );
                }),

                /// Add button
                /// Add button
                SizedBox(
                  height: 70.h,
                ),
                Container(
                  //   color: Colors.red,
                  width: 290,
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      timerProvider.isLock
                          ? GestureDetector(
                              onTap: () {
                                timerProvider.removeIndicator();
                              },
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // gradient: LinearGradient(
                                  //   colors: [Color(0xffED631C), Color(0xffED631C).withOpacity(0.40)],
                                  //   begin: Alignment.topLeft,
                                  //   end: Alignment.bottomRight,
                                  //
                                  // ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 40,
                            ),

                      SizedBox(
                        width: 20,
                      ),
                      Consumer<TimerProvider>(
                        builder: (context, timerProvider, _) {
                          return Container(
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
                                timerProvider.togglePlayPause();
                                timerProvider.isLock = false;
                                print('${timerProvider.isPlaying}');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    timerProvider.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.black,
                                  ),
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
                          );
                        },
                      ),

                      /// +
                      SizedBox(
                        width: 20,
                      ),
                      timerProvider.isLock
                          ? GestureDetector(
                              onTap: () {
                                timerProvider.addIndicator();
                              },
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // gradient: LinearGradient(
                                  //   colors: [Color(0xffED631C), Color(0xffED631C).withOpacity(0.40)],
                                  //   begin: Alignment.topLeft,
                                  //   end: Alignment.bottomRight,
                                  // ),

                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 38,
                            ),
                      //  SizedBox(width: 20,),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => BreakScreen());

                        timerProvider.isPlaying = !timerProvider.isPlaying;
                        if (timerProvider.isPlaying) {
                          if (timerProvider.timer == null ||
                              !timerProvider.timer!.isActive) {
                            timerProvider.startTimer();
                          }
                        } else {
                          timerProvider.pauseTimer();
                        }
                      },
                      child: Hero(
                        tag: 'break',
                        child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Align(
                                child: SvgPicture.asset(
                              "assets/icons/breakcup.svg",
                              color: Colors.black,
                              height: 20.h,
                              width: 20.w,
                            ))),
                      ),
                    ),
                  ],
                ),
              ])),
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

  Future<void> saveData(int seconds, int minutes) async {
    final data = Project(
      title: widget.title,
      minutes: minutes,
      description: widget.description,
      totalSeconds: seconds,
    );
    box.add(data);
    data.save();
    print('Saved');
  }
}

class SmallIndicator extends StatelessWidget {
  final double percent;
  final bool trophy;

  SmallIndicator({Key? key, required this.percent, required this.trophy});

  @override
  Widget build(BuildContext context) {
    final color = trophy ? Color(0xff129B12) : Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CircularPercentIndicator(
        radius: 22.0,
        backgroundColor: color,
        progressColor: Colors.white,
        lineWidth: 3.0,
        percent: percent,
        center: trophy
            ? Image.asset("assets/icons/Tree.png",height: 27.h,width: 27.w,color: color,)
            // Icon(
            //   Icons.wine_bar_sharp,
            //   color: Colors.white,
            // )
            : SizedBox(), // Hide the center if data is null
      ),
    );
  }
}

/// Model
class TimerTracksModel {
  int start;
  int minute;
  bool trophy;

  TimerTracksModel(
      {required this.start, required this.minute, this.trophy = false});
}
