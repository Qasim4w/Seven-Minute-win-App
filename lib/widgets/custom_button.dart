import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';

Widget customButton({
  double height = 53,
  double width = double.infinity,
  String Text = "",
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
  Color fontColor = Colors.white,
  Color color = Colors.white,
  double borderRadius = 40,
  Function ?ontap
}){
  return GestureDetector(
    onTap: (){
      ontap!();
    },
    child: Container(
    height: height,
      width: Get.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Center(child: customTextRegular(title: Text,fontSize: fontSize,fontWeight: fontWeight,color: fontColor,latterSpacing: 1.5),),
    ),
  );
}