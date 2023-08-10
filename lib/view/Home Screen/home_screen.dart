import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:seven_min_track/utils/app_constant.dart';
import 'package:seven_min_track/view/Home%20Screen/project_detail.dart';
import 'package:seven_min_track/view/lets_go.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';
import '../Add Details/Add data.dart';
import '../hidve_database/create_project.dart';
import '../hidve_database/data_retrieve.dart';
import '../hidve_database/date_model.dart';
import 'let_see.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Box<Project> box; // Declare the box variable
  late Box<DateModel> boxx; // Declare the box variable

  Future<void> openHiveBox() async {
    box = await Hive.openBox<Project>('projects');
  }

  @override
  void initState() {
    super.initState();

    // print('${projects}');
    box  =    Hive.box<Project>('projects');
    boxx  =    Hive.box<DateModel>('dateBox');


    // box = Hive.box<DataModel>('dataBox');
    // boxx = Hive.box<DateModel>('dateBox');

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation.
    _controller.forward();
//    openHiveBox();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _deleteProject(int index) async {
    final box = await Hive.openBox<Project>('projects');
    await box.deleteAt(index);
  }
  // final box = Hive.box<Project>('projects');
  // final List<Project> projects = box.values.toList();

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = box.values.toList();
    // final List<DateModel> dates = box.values.toList();
//    print("${ projects.totalSeconds.toString()}");

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xffbde0fe),

          gradient: LinearGradient(
            colors: [AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:Column(
          children: [
            SizedBox(height: 55.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [



                      AnimatedBuilder(
                      animation: _animation,
                       builder: (context, child) {
                        return Center(

                         child: Opacity(
                        opacity: _animation.value,
                          child: customTextRegular(
                         title: "Hello, Nouman",
                        fontWeight: FontWeight.w700,
                        fontSize: 24.w,
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),
                      SizedBox(height: 5,),
                      Center(child: customTextRegular(title: "Your Focused Projects",fontWeight: FontWeight.w400,fontSize: 16.w,color: AppColors.white)),

                    ],
                  ),

                  GestureDetector(
                    onTap: (){
                    //  Get.to(()=>Done());
                   //   Get.to(() => AnotherScreen(projectKey: ));
                    },
                    child: Container(
                      height: 54.w,
                      width: 54.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                        border: Border.all(color: AppColors.blue,width: 1),
                        image: DecorationImage(
                          image: AssetImage("assets/images/nouman.png"),
                          fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w,),
        Expanded(
          child: GridView.builder(
            itemCount: projects.length,
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            shrinkWrap: true,

            physics: AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 120,
              crossAxisSpacing: 20,
              childAspectRatio: 6 / 4,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return GestureDetector(
                onTap: () async{

                _navigateToProjectDetail(context,project.title);

                },
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1, end: 1.05).animate(
                    CurvedAnimation(
                      parent: AlwaysStoppedAnimation(1),
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    width: 178.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.25),width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 140,
                            // color: Colors.red,
                              child: customTextRegular(
                                maxlines: 1,
                                latterSpacing: 1,
                                title:  project.title,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.w,
                                color: Colors.black,

                              //  letterSpacing: 0.4,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  Get.to(()=> LetsGoScreen(project.title, project.description,false));
                                },
                                child: Icon(Icons.add,color: AppColors.blue,)),
                            SizedBox(width: 10.w,),

                            GestureDetector(
                                onTap: ()async{
                                  _showDeleteDialog(context, index);

                                  // await _deleteProject(index);
                                  // setState(() {});
                                },
                                child: Icon(Icons.delete,color: Colors.red,size: 20,))
                          ],
                        ),
                        // SizedBox(height: 11.w),
                        Container(
                        // color: Colors.red,
                          height: 60.h,
                          child: customTextRegular(
                            title: project.description,
                            fontWeight: FontWeight.w300,
                            latterSpacing: 1.3,
                            fontSize: 14.w,
                            overflow: TextOverflow.ellipsis,
                            maxlines: 4,
                            color: Colors.black.withOpacity(0.70),
                            //letterSpacing: 0.4,
                          ),
                        ),
                        // SizedBox(height: 11.w),
                        Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextRegular(
                              title: "Time spent",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.w,
                              color: Colors.black,
                       //   letterSpacing: 0.4,
                            ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                  children: [

                                    TextSpan(
                                        text: "${project.minutes.toString()}",
                                        style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.w500,color: AppColors.blackColor)
                                    ),
                                    TextSpan(text: ' '),
                                    TextSpan(
                                        text: "min",
                                        style: TextStyle(fontSize: 10.h,fontWeight: FontWeight.w500,color: AppColors.blackColor)
                                    ),
                                    TextSpan(text: '  '),
                                    TextSpan(
                                        text: "${project.totalSeconds.toString()}",
                                        style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.w500,color: AppColors.blackColor)
                                    ),
                                    TextSpan(text: ' '),
                                    TextSpan(
                                        text: "sec",
                                        style: TextStyle(fontSize: 10.h,fontWeight: FontWeight.w500,color: AppColors.blackColor)
                                    ),



                                  ]
                              ),
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

            // Expanded(
            //   child: GridView.builder(
            //     itemCount: 6,
            //     padding: EdgeInsets.zero,
            //     shrinkWrap: true,
            //     physics: AlwaysScrollableScrollPhysics(),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 165,
            //     crossAxisSpacing: 10,
            //     childAspectRatio: 6/4,
            //     mainAxisSpacing: 20,
            //   ), itemBuilder: (context,index){
            //     return GestureDetector(
            //       onTap: (){
            //         Get.to(()=> ProjectDetail());
            //       },
            //       child: Container(
            //         padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
            //         width: 178.w,
            //         decoration: BoxDecoration(
            //             color: AppColors.greyd9,
            //             borderRadius: BorderRadius.circular(10)
            //         ),
            //         child: Column(
            //           children: [
            //             customTextRegular(title: "Joy App UI Design",fontWeight: FontWeight.w600,fontSize: 15.w,color: Colors.black,latterSpacing: 0.4),
            //             SizedBox(height: 11.w,),
            //             customTextRegular(title: AppConstant.lorem,fontWeight: FontWeight.w400,fontSize: 10.w,color: Colors.black.withOpacity(0.70),latterSpacing: 0.4),
            //             SizedBox(height: 11.w,),
            //             customTextRegular(title: "Time spent",fontWeight: FontWeight.w600,fontSize: 10.w,color: Colors.black,latterSpacing: 0.4),
            //             customTextRegular(title: "2 hrs 55 mins",fontWeight: FontWeight.w600,fontSize: 15.w,color: AppColors.brownColor56,latterSpacing: 0.4),
            //
            //           ],
            //         ),
            //       ),
            //     );
            //   }),
            // ),

          ],
        ),
      ),

      floatingActionButton: SpeedDial(

        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(

            closeSpeedDialOnPressed: true,
            child: Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,

            label: 'New Projects',

            onPressed: () {
                // Get.to(LetsGoScreen());
                Get.to(()=> CreateProjectScreen());
            },
          ),
          SpeedDialChild(
            closeSpeedDialOnPressed: true,
            child: const Icon(
              Icons.contact_phone_rounded,
              color:AppColors.primaryColor,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            label: 'Contacts',
            onPressed: () {
              // setState(() {
              //   Get.to(breakScreen());
              // });
            },
          ),
          SpeedDialChild(

            closeSpeedDialOnPressed: false,
            child: Icon(
              Icons.person_outline,
              color: AppColors.primaryColor,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            label: 'Profile',
            onPressed: () {
            //  Get.to(project_details());
            },
          ),
        ],
        labelsStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Tillana-Bold', fontSize: 15.sp,),

        labelsBackgroundColor: AppColors.white,
        closedForegroundColor: AppColors.blackColor,
        openForegroundColor: AppColors.blackColor,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.white,
        child: Icon(
          Icons.more_vert,
          size: 40,
          color: AppColors.blue,
        ),
      ),
    );
  }
  void _navigateToProjectDetail(BuildContext context,String title) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: Done(title: title), // Replace ProjectDetail() with your actual screen widget.
          );
        },
      ),
    );
  }
  Future<void> _showDeleteDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Project'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this project?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                await _deleteProject(index);
                Navigator.of(context).pop();
                setState(() {

                });
              },
            ),
          ],
        );
      },
    );
  }

}
