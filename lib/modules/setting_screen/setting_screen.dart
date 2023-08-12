// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:iti_projects/component/component.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            buildSettingItem1(),
            buildSettingItem2(),
          ],
        ),
      ),
    );
  }
}