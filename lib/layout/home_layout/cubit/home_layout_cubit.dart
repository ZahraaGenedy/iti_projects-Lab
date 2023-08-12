import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../modules/booking_tests/Tests_screen.dart';
import '../../../modules/booking_tests/booking_screen.dart';
import '../../../modules/home_screen/home_screen.dart';
import '../../../modules/setting_screen/setting_screen.dart';

part 'home_layout_state.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
    static HomeLayoutCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
  HomeScreen(),
  BookingScreen(),
  TestsScreen(),
  SettingScreen(),
 ]; 
   void changeIndex (int index){
    currentIndex=index;
    emit(BookChangeBottomNavBarState());
  }
}

