// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/modules/booking_tests/cubit/book_cubit.dart';


import '../../component/component.dart';
import '../../style/colors.dart';
class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookState>(
      builder: (context,state){
        var tasks = BookCubit.get(context).newTests;
        return tasksBuilder(tasks: tasks);
      },
       listener: (context,state){});
  }
}