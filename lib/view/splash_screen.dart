import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Add Details/Add data.dart';

class SplashLogo extends StatefulWidget {
  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {

  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => CreateProjectScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("7 Mins Win",style: TextStyle(fontSize: 42,fontWeight: FontWeight.w600,color: Colors.red),),
      ),
    );
  }
}
