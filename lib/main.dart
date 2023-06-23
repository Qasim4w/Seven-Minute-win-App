import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/Pracitce/practice.dart';
import 'package:seven_min_track/Provider/Home%20Provider.dart';
import 'Add Details/Add data.dart';
import 'Home Screen/Home.dart';
import 'Models/ProjectModel.dart';
import 'Models/TimerModel.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(AllProjectsListModelAdapter());
    Hive.registerAdapter(TimerTracksModelAdapter());

    await Hive.openBox<AllProjectsListModel>('list Box');
    await Hive.openBox<TimerTracksModel>('counterBox');


    runApp(
    ChangeNotifierProvider(
    create: (context) => home_provider(),
        child: const MyApp()));
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
          home: data(),
        );
      },
    );
  }
}
