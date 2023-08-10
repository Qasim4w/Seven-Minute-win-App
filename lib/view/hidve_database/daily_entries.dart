import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// part 'daily_entry.g.dart';

class DailyEntry extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String inputText;

  DailyEntry(this.dateTime, this.inputText);
}
