import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/Provider/Home%20Provider.dart';
import 'package:seven_min_track/Provider/signup_provider.dart';
import 'package:seven_min_track/utils/app_colors.dart';
import 'package:seven_min_track/view/Home%20Screen/Home.dart';
import 'package:seven_min_track/view/Home%20Screen/home_screen.dart';
import 'package:seven_min_track/view/auth/forgot_passward.dart';
import 'package:seven_min_track/view/auth/reset_passward_screen.dart';
import 'package:seven_min_track/view/auth/login_screen.dart';
import 'package:seven_min_track/view/auth/sign_up.dart';
import 'package:seven_min_track/view/auth/splash_screen.dart';
import 'package:seven_min_track/view/hidve_database/create_project.dart';
import 'package:seven_min_track/view/hidve_database/date_model.dart';
import 'package:seven_min_track/view/hidve_database/existing_data.dart';
import 'package:seven_min_track/view/lets_go.dart';
import 'package:seven_min_track/view/lets_start/lets_start.dart';
import 'package:seven_min_track/view/lets_start/onboarding_screen.dart';
import 'package:seven_min_track/view/new-login/input_helper.dart';
import 'package:seven_min_track/view/new-login/signin_button.dart';
import 'package:seven_min_track/view/new-login/teddy_controller.dart';
import 'package:seven_min_track/widgets/custom_text_widgets.dart';

import 'Models/TimerModel.dart';
import 'view/new-login/tracking_input.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProjectAdapter());
  await Hive.openBox<Project>('projects');

  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('dataBox');

  Hive.registerAdapter(DateModelAdapter());
  await Hive.openBox<DateModel>('dateBox');


  // WidgetsFlutterBinding.ensureInitialized();
    // var directory = await getApplicationDocumentsDirectory();
    // Hive.init(directory.path);
    //
    // Hive.registerAdapter(AllProjectsListModelAdapter());
    // Hive.registerAdapter(TimerTracksModelAdapter());
    //
    // await Hive.openBox<AllProjectsListModel>('list Box');
    // await Hive.openBox<TimerTracksModel>('counterBox');
    runApp(
      MultiProvider(providers: [
      ChangeNotifierProvider<TimerProvider>(create: (context)=> TimerProvider()),
      ChangeNotifierProvider<SignUpProvider>(create: (context)=> SignUpProvider()),

      ],
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  TrackingTextInput({
    // required Key key,
    required this.onCaretMoved,
    required this.onTextChanged,
    required this.hint,
    required this.label,
    this.isObscured = false,
  });

  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final String hint;
  final String label;
  final bool isObscured;

  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
 // late Timer _debounceTimer;
  late Timer _debounceTimer = Timer(Duration.zero, () {});

  @override
  void dispose() {
    _debounceTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject? fieldBox =
          _fieldKey.currentContext!.findRenderObject();
          if (fieldBox is RenderBox) {
            Offset? caretPosition = getCaretPosition(fieldBox);

            if (widget.onCaretMoved != null && caretPosition != null) {
              widget.onCaretMoved(caretPosition);
            }
          }
        }
      });
      if (widget.onTextChanged != null) {
        widget.onTextChanged(_textController.text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.h,fontFamily: 'EnnVisions'),
        decoration: InputDecoration(

          hintText: widget.hint,
          hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.h,fontFamily: 'EnnVisions'),
          labelText: widget.label,
          labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.h,fontFamily: 'EnnVisions'),
        ),
        key: _fieldKey,
        controller: _textController,
        obscureText: widget.isObscured,
        validator: (value) {},
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final Function onPressed;

  const SigninButton({

    required this.child,
  //  required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // gradient: gradient,
        color: color
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }

}
