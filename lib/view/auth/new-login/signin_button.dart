import 'package:flutter/material.dart';



class SigninButton extends StatelessWidget {
  final Widget child;
 // final Gradient gradient;
  final Color color;
  final double width;
  final double height;
  final void Function() onPressed; // Update the type to void Function()

  const SigninButton({
    // required Key key,
    required this.child,
    required this.color,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
        // gradient: LinearGradient(
        //   colors: [
        //     AppColors.blue,
        //     AppColors.lightgreen
        //   ],


          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
     //   ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
