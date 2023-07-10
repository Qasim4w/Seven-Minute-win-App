import 'package:flutter/material.dart';

Widget customExtraBold({required String title,Color color = Colors.black,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal}){
  return Text(title,style: TextStyle(
    fontFamily: 'Poppins-ExtraBold',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,

  ),
    textAlign: textAlign,
  );
}

Widget customTextBold({required String title,Color color = Colors.black,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start,}){
  return Text(title,style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Poppins-Bold'
    // height: 1.5,
    // wordSpacing: 5
  ),
    textAlign: textAlign,
  );
}

Widget customTextRegular({required String title,double latterSpacing = 1.3 ,Color color = Colors.black,TextAlign textAlign =TextAlign.start, double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start}){
  return Text(title,style: TextStyle(
    fontSize: fontSize,
    fontFamily: 'Poppins-Regular',
   // fontFamily: 'Montserrat-VariableFont_wght',
    fontWeight: fontWeight,
    color: color,
    height: 1.5,
    letterSpacing: latterSpacing,

  ),
    //  maxLines: 2,
    //  overflow: TextOverflow.ellipsis,
    textAlign: align,
  );
}
