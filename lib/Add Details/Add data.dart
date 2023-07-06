import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:seven_min_track/Pracitce/practice.dart';

import '../Boxes/boxes.dart';
import '../Models/ProjectModel.dart';
import '../view/lets_go.dart';

class data extends StatefulWidget {
  const data({Key? key}) : super(key: key);

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  TextEditingController projectControler = TextEditingController();
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEE616A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0675C1),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon( Icons.arrow_back_ios),),
        title: Center(child: Text('New project',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.white),)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                Text('Add New Project',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 18.sp,color: Colors.black),),

                SizedBox(height: 25.h),
                /// Project name TextField
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    style: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 17.sp,color: Colors.black),
                    controller: projectControler,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(.3),
                      enabled: true,
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      hintText: 'project name',
                      hintStyle: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 15.sp,color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),
                /// title TextField
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    style: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 17.sp,color: Colors.black),
                    controller: titleControler,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        // borderSide: BorderSide.none,
                      ),
                      hintText: 'title',
                      hintStyle: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 15.sp,color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),
                /// description TextField
                SizedBox(
                  height: 120.h,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    controller: descriptionControler,
                    style: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 17.sp,color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(.3),
                      enabled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        // borderSide: BorderSide.none,
                      ),
                      hintText: 'note',
                      hintStyle: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 15.sp,color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 340.h),
                /// add project button
                GestureDetector(
                  onTap: (){
                  //  Get.to(LetsGoScreen());
                    Get.offAll(() => LetsGoScreen());
                   // final data =
                    // AllProjectsListModel(
                    //     projectName: projectControler.text,
                    //     title: titleControler.text,
                    //     description: descriptionControler.text
                    // );
                    // var box = Boxes.getData1();
                 //   box.add(data);
                 //   data.save();
                 //    print(data.toString());
                 //    projectControler.clear();
                 //    titleControler.clear();
                 //    descriptionControler.clear();
                  },
                  child: Container(
                    height: 60.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: Color(0xFF0675C1),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                        child: Text('Add Project',
                          style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 17.sp,color: Colors.white),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}