import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';
import '../hidve_database/create_project.dart';
import '../hidve_database/date_model.dart';
import '../hidve_database/existing_data.dart';

class ProjectDetail extends StatefulWidget {
  String title;

  ProjectDetail({super.key, required this.title});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  late Box<DataModel> box; // Declare the box variable
  late Box<DateModel> boxx; // Declare the box variable

  @override
  void initState() {
    super.initState();

    // box = Hive.box<Project>(projectBoxName); // Initialize the box variable
    // boxx = Hive.box<DateModel>('dateBox');

    box = Hive.box<DataModel>('dataBox');
    boxx = Hive.box<DateModel>('dateBox');
    // openHiveBox(); // Call the method to open the Hive box
  }

  Future<void> openHiveBox() async {
    box = await Hive.openBox<DataModel>('dataBox');
  }

  int currentIndex = 1;
  DateModel? _dateModel;


  @override
  Widget build(BuildContext context) {
    final List<DataModel> projects = box.values.toList();
    final List<DateModel> DateModelData = boxx.values.toList();
    print('date is ${_dateModel?.date}');
    // print('The currentIndex is ${ DateModelData.isNotEmpty ? DateModelData[0].currentIndex : 0}');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                child: ListView.builder(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {

                      final date = DateModelData[index];

                      // DateTime targetDate = DateTime(2023, 8, 10);
                      // // Check if the project's date is the same as the current date
                      // bool isSameDate = projects[index].date.isAtSameMomentAs( DateTime(2023, 8, 10));
                      //
                      //   print('project date is ${projects[index].date}');
                      //   print('now date  is ${DateTime.now()}');
                      //
                      // // Update currentIndex based on the date comparison
                      // if (!isSameDate) {
                      //   currentIndex++; // Increase currentIndex if dates are different
                      //   print('currentIndex is $currentIndex');
                      // }

                      return Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Current Index: ${DateModelData[index].currentIndex ?? "N/A"}'),
                              // Text(
                              //   // DateFormat('dd/MM/yyyy').format(DateModelData[index].date),
                              //   '${_dateModel[index].currentIndex}',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w500,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.blue,
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(7),
                              visualDensity: const VisualDensity(
                                vertical: -4,
                                horizontal: -4,
                              ),
                              subtitle: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      projects.length,
                                      (index) => Row(
                                        children: [
                                          customTextRegular(
                                            title:
                                                "${projects[index].minutes} mins",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                          SizedBox(width: 10),
                                          customTextRegular(
                                            title:
                                                "${DateFormat('hh:mm a').format(projects[index].startTime)} - ${DateFormat('hh:mm a').format(projects[index].endTime)}",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 7,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: AppColors.white,
                                  width: 0.8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// import '../hidve_database/existing_data.dart';
// class ProjectDetail extends StatefulWidget {
//
//   const ProjectDetail({super.key});
//
//   @override
//   State<ProjectDetail> createState() => _ProjectDetailState();
// }
//
// class _ProjectDetailState extends State<ProjectDetail> {
//
//     // DateTime now = DateTime.now();
//   // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
//   // print(formattedDateTime);
//
//
//   late Box<DataModel> box; // Declare the box variable
//
//   @override
//   void initState() {
//     super.initState();
//     box = Hive.box<DataModel>('dataBox');
//     // openHiveBox(); // Call the method to open the Hive box
//   }
//
//   // Future<void> openHiveBox() async {
//   //   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
//   //   Hive.init(appDocumentDir.path);
//   //
//   //   box = await Hive.openBox<DataModel>('dataBox');
//   // }
//
//   Future<void> openHiveBox() async {
//     box = await Hive.openBox<DataModel>('dataBox');
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<DataModel> projects = box.values.toList();
//
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(height: 200,),
//               Container(
//
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                     itemCount: projects.length,
//                     itemBuilder: (context,index){
//
//                       final project = projects[index];
//
//
//                   return Container(
//                     color: Colors.yellow,
//                     height: 100,width: double.infinity,
//                       child: Text(project.seconds.toString(),style: TextStyle(fontSize: 24,color: Colors.black),),
//                   );
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
