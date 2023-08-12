// ignore_for_file: prefer_const_constructors, unused_import, must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;
import 'package:iti_projects/log_sign/features/login/login_screen.dart';
import 'package:iti_projects/log_sign/features/sig_log/sig_log.dart';
import 'package:iti_projects/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:iti_projects/style/colors.dart';

class Onboarding extends StatelessWidget {
   Onboarding({super.key});
  PageController nextpage = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        OnboardingCubit cubit =OnboardingCubit.get(context) ;
        return Scaffold(
          backgroundColor: secondaryColor, //Color(0xff276BB2),
          body: PageView(
            controller: nextpage,
            onPageChanged: (value) {
              cubit.changePageNumberOnboarding(value);
            },
            children: [
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/image1c.png'),
                      const Text(
                        "Check your body to protect your self ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        //splashColor: Color(0xfffbd153),
                        onTap: () {
                          nextpage.animateToPage(1,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                            width: 120.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white70),
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      cubit.dotpageView(),
                    ]),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/image2.png'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: const [
                        Text(
                          "GOOD ",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white //Color(0xffc5e7f9),
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.celebration,
                            size: 50, color: Color(0xfffbd153)),
                      ],
                    ),
                  ),
                  Text("Decision, let's make you Healthier",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    //splashColor: Color(0xfffbd153),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => home_log_sig_screen()));
                    },
                    child: Container(
                      
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "Get started",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 cubit.dotpageView(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
