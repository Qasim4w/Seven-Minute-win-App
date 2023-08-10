import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'create_project.g.dart';
// part 'create_project.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  String projectName;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int minutes;

  @HiveField(4)
  int totalSeconds;

  Project({
     this.projectName = "",
     this.title = "null",
     this.description = "null",
     this.minutes = 0,
   required this.totalSeconds  ,
  });
}

// @HiveType(typeId: 0)
//
// class Project extends HiveObject {
//   @HiveField(0)
//   String projectName;
//
//   @HiveField(1)
//   String title;
//
//   @HiveField(2)
//   String description;
//
//   Project({required this.projectName, required this.title, required this.description});
// }
