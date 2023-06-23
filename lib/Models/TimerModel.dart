



import 'package:hive/hive.dart';
part 'TimerModel.g.dart';

@HiveType(typeId: 1)
class TimerTracksModel extends HiveObject{

  @HiveField(0)
  late var count;

  TimerTracksModel({
    required this.count,
  });
}