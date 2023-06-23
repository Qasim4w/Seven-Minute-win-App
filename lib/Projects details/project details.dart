import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:seven_min_track/Add%20Details/Add%20data.dart';
import 'package:seven_min_track/Boxes/boxes.dart';
import 'package:seven_min_track/Models/ProjectModel.dart';
import 'package:seven_min_track/Models/TimerModel.dart';

class project_details extends StatefulWidget {
   project_details({Key? key}) : super(key: key);


  @override
  State<project_details> createState() => _project_detailsState();

}

class _project_detailsState extends State<project_details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              children: [
                SizedBox(height: 30,),

                ValueListenableBuilder<Box<AllProjectsListModel>>(
                    valueListenable: Boxes.getData1().listenable(),
                    builder: (BuildContext context, box, _ ) {
                      var maazdata = box.values.toList().cast<AllProjectsListModel>();
                      return Expanded(
                        child: ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: (){
                              /// alert dialog
                              Get.defaultDialog(
                                title: 'Delete',
                                titleStyle: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.black),
                                content: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text('Are you sure you want to Delete this Project?',
                                    style: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 15.sp,color: Colors.black),),
                                ),
                                actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                    child:  Text('Cancel',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.blue),)),
                                //Cancel button
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                  _delete(maazdata[index]);
                                },
                                    child: Text('Delete',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.blue),)),
                              ], );
                              // _showDialogBox();
                            },
                            child: Card(
                              child: Text(maazdata[index].projectName.toString(), style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 17.sp,color: Colors.black),),
                            ),
                          );
                        },),
                      );
                    }
                ),

                ValueListenableBuilder<Box<TimerTracksModel>>(
                    valueListenable: Boxes.getData2().listenable(),
                    builder: (BuildContext context, box2, _ ) {
                      var maazData2 = box2.values.toList().cast<TimerTracksModel>();
                      return Text(maazData2[0].count.toString(),
                        style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 17.sp,color: Colors.black),);
                    }
                ),

                ValueListenableBuilder<Box<TimerTracksModel>>(
                  valueListenable: Boxes.getData2().listenable(),
                  builder: (BuildContext context, box2, _) {
                    var maazData2 = box2.values.toList().cast<TimerTracksModel>();
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: box2.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                                  onTap: (){
                                    /// alert dialog
                                    Get.defaultDialog(
                                      title: 'Delete',
                                      titleStyle: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.black),

                                      content: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                        child: Text('Are you sure you want to Delete this Project?',
                                          style: TextStyle(fontFamily: 'RobotoMono-Regular',fontSize: 15.sp,color: Colors.black),),
                                      ),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        },
                                            child:  Text('Cancel',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.blue),)),
                                        //Cancel button
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                          _delete2(maazData2[index]);
                                        },
                                            child: Text('Delete',style: TextStyle(fontFamily: 'RobotoMono-Bold',fontSize: 20.sp,color: Colors.blue),)),
                                      ], );
                                    // _showDialogBox();
                                  },
                                  child: Icon(Icons.wine_bar_sharp,color: Colors.amber,));
                        },),
                    );


                  },),

              ],
            ),
          )
      ),
    );

}


  void _delete(AllProjectsListModel allProjectsListModel) async {
    await allProjectsListModel.delete();
  }

  void _delete2(TimerTracksModel timerTracksModel) async {
    await timerTracksModel.delete();
  }


  Future <void> _showDialogBox() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              ///Add button
              TextButton(onPressed: (){Navigator.pop(context);
              }, child: const Text('cancel')),
              //Cancel button
              TextButton(onPressed: (){
                // _delete(data[]);
              },
                  child: const Text('Delete')),
            ],
          );
        }
    );
  }
}
