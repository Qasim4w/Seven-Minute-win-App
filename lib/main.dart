import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/Provider/Home%20Provider.dart';
import 'package:seven_min_track/Provider/signup_provider.dart';
import 'package:seven_min_track/view/auth/login_screen.dart';
import 'package:seven_min_track/view/lets_go.dart';

void main() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // var directory = await getApplicationDocumentsDirectory();
    // Hive.init(directory.path);
    //
    // Hive.registerAdapter(AllProjectsListModelAdapter());
    // Hive.registerAdapter(TimerTracksModelAdapter());

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
          home: LoginScreen(),
        );
      },
    );
  }
}
