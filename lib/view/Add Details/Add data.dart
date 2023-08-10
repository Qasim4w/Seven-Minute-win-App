import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import '../../utils/app_colors.dart';
import '../hidve_database/create_project.dart';
import '../hidve_database/data_retrieve.dart';
import '../lets_go.dart';
import '../lets_start/lets_start.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {


  TextEditingController projectControler = TextEditingController();
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
   String projectBoxName = 'projects';
  late Box<Project> box; // Declare the box variable


  Future<void> openHiveBox() async {
    box = await Hive.openBox<Project>('projects');
  }

  void initState() {
    super.initState();
    box = Hive.box<Project>(projectBoxName); // Initialize the box variable
    openHiveBox();

  }

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'New project',
          style: TextStyle(
            fontFamily: 'RobotoMono-Bold',
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, AppColors.lightgreen.withOpacity(0.50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView( // Wrap the content with SingleChildScrollView
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Add New Project',
                    style: TextStyle(
                      fontFamily: 'RobotoMono-Bold',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  SizedBox(
                    height: 50.h,
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: 'RobotoMono-Regular',
                        fontSize: 17.sp,
                        color: Colors.black,
                      ),
                      controller: projectControler,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        hintText: 'project name',
                        hintStyle: TextStyle(
                          fontFamily: 'RobotoMono-Regular',
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 180.h,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      maxLines: 5,
                      controller: descriptionControler,
                      style: TextStyle(
                        fontFamily: 'RobotoMono-Regular',
                        fontSize: 17.sp,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.25), width: 1.0),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: 'note',
                        hintStyle: TextStyle(
                          fontFamily: 'RobotoMono-Regular',
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        child: GestureDetector(
          onTap: () async {

            Get.to(() => LetsGoScreen(projectControler.text,descriptionControler.text,true));
              //   saveData();
        //     final projectText = projectControler.text;
        //     final titleText = titleControler.text;
        //     final descriptionText = descriptionControler.text;
        //
        //     // Create a new Project object with the data
        //     final newProject = Project(
        //       projectName: projectText,
        //       title: titleText,
        //       description: descriptionText,
        //      // totalSeconds: seconds,
        //     );
        //
        //     // Save the project to the Hive database
        //   ///  final key = await box.add(newProject);
        //
        //     // Clear the text fields after saving
        //     projectControler.clear();
        //     titleControler.clear();
        //     descriptionControler.clear();
        //    Global.projectKey = key.toString();
        //
        // //    Fetch the project from the box using the key
        //    final savedProject = box.get(key);
        //
        //   //  Now you can access the data from the savedProject object
        //     if (savedProject != null) {
        //       print('data is ${savedProject.title}');
        //     }
        //     print("projec key is${ Global.projectKey}");
        //   //  Get.to(() => AnotherScreen(projectKey:key ));
        //
           },
          child: Container(
            height: 50.h,
          width: 200.w,
          margin: EdgeInsets.only(right:80,bottom: 10 ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Center(
              child: Text(
                'Add Project',
                style: TextStyle(
                  fontFamily: 'RobotoMono-Bold',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
  // void saveData(){
  //   final data = Project(
  //     totalSeconds: int.parse("") ,
  //
  //     title: projectControler.text,
  //     description: descriptionControler.text,);
  //   box.add(data);
  //   data.save();
  //   print('Saved');
  // }
}
class Global {
  static String projectKey = '';
}