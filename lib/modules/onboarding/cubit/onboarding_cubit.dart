import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

    static OnboardingCubit get(context)=> BlocProvider.of(context);

  int pagenumber = 0;

  void changePageNumberOnboarding(value) {
    pagenumber = value;
    emit(BookChangePageNumberState());
  }
  

  Widget dotpageView() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 2; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: i == pagenumber ? 25 : 6,
              height: 6,
              decoration: BoxDecoration(
                  color: i == pagenumber
                      ? const Color((0xffA2CB07))
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50)),
            ),
        ],
      );
    });
  }
}
