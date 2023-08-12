import 'package:flutter/material.dart';

class TasksModel{
      String imagePath;
     String tasksTitle;
     IconData icon;
     String statu;
     Color color;
     TasksModel({
      required this.imagePath,
      required this.tasksTitle,
      required this.icon,
      required this.statu,
      required this.color,
     });
     
}