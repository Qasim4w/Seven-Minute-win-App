import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seven_min_track/view/auth/sign_up.dart';

import '../../main.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';
import '../new-login/teddy_controller.dart';

import 'forgot_passward.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TeddyController _teddyController;

  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      // backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
          // gradient: LinearGradient(
          //   colors: [Color(0xff7ef29d), Color(0xff0f68a9)],
          //
          //
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  //   Box decoration takes a gradient
                  gradient: LinearGradient(
                    colors: [Color(0xff7ef29d), Color(0xff0f68a9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: FlareActor(
                        "assets/Teddy.flr",
                        shouldClip: false,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        controller: _teddyController,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TrackingTextInput(

                                label: "Email",
                                hint: "What's your email address?",
                                onCaretMoved: (Offset caret) {
                                  _teddyController.lookAt(caret);
                                }, onTextChanged: (String text) {  },
                              ),
                              TrackingTextInput(
                                label: "Password",
                                hint: "Try 'bears'...",
                                isObscured: true,
                                onCaretMoved: (Offset caret) {
                                  _teddyController.coverEyes(caret != null);
                                  _teddyController.lookAt(null);
                                },
                                onTextChanged: (String value) {
                                  _teddyController.setPassword(value);
                                },
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        Get.to(()=>ForgotPassward());
                                      },
                                      child: customTextBold(title: "Forget Passward?",fontSize: 16.h,fontWeight: FontWeight.w500,color: AppColors.blackColor)),
                                ],
                              ),
                              SizedBox(height: 14.h,),
                              SigninButton(

                              color: Colors.black.withOpacity(0.80),
                                height: 50.h,
                                child:
                                customTextBold(title: "Sign In",fontSize: 22.h,fontWeight: FontWeight.w500,color: Colors.white),

                                // Text(
                                //   "Sign In",
                                //   style: TextStyle(
                                //     fontFamily: "RobotoMedium",
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                onPressed: () {
                                  _teddyController.submitPassword();

                                },
                                // gradient: LinearGradient(
                                //   colors: [Color(0xff7ef29d), Color(0xff0f68a9)],
                                //
                                //
                                //   begin: Alignment.topLeft,
                                //   end: Alignment.bottomRight,
                                // ),
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customTextBold(title: "Do not have account? ",fontSize: 18.h,fontWeight: FontWeight.w400,color: Colors.black),
                                  GestureDetector(
                                      onTap: (){
                                        Get.to(()=> SignUpScreen());
                                      },
                                      child: customTextBold(title: "Sign Up",fontSize: 18.h,fontWeight: FontWeight.w600,color: Colors.black)),
                                  //  Text("  auonik",style: TextStyle(fontSize: 26.h,fontWeight: FontWeight.w400),),
                                  //   Text("SignIn",style: GoogleFonts.mons,)
                                  // Text("Do not have account? ",style: TextStyle(fontSize: 16.h,fontWeight: FontWeight.w400,color: Colors.black),),
                                  // Text("Sign In",style: TextStyle(fontSize: 18.h,fontWeight: FontWeight.w400,color: Colors.blue),),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
