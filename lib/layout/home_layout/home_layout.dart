// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/layout/home_layout/cubit/home_layout_cubit.dart';

import 'package:iti_projects/modules/booking_tests/cubit/book_cubit.dart';
import '../../modules/booking_tests/Tests_screen.dart';
import '../../style/colors.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // Get a location using getDatabasesPath

  @override
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeLayoutCubit cubit=HomeLayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: secondaryColor,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: 'Booking'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_open), label: 'Tests'),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ]),
          
          body: ConditionalBuilder(
            condition: state is! BooklodingDataState,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
