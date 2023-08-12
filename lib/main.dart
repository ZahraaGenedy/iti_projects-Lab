import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
  import 'package:iti_projects/log_sign/features/login/cubit/login_cubit.dart';
import 'package:iti_projects/log_sign/network/dio_helper.dart';
import 'package:iti_projects/language_cubit/language_cubit.dart';
import 'package:iti_projects/layout/home_layout/cubit/home_layout_cubit.dart';
import 'package:iti_projects/modules/booking_tests/cubit/book_cubit.dart';
import 'package:iti_projects/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:iti_projects/modules/splash_screen/splash_screen.dart';

import 'bloc_observer.dart';
import 'log_sign/features/create_account/cubit/create_account_cubit.dart';

void main() async {
  // init hive

  Bloc.observer = AppBlocObserver();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),


        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CreateAccountCubit(),
        ),
        BlocProvider(
          create: (context) => BookCubit()..createDb(),
        ),
        BlocProvider(
          create: (context) => HomeLayoutCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),

      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
              title: 'Flutter Demo',
              locale: context.read<LanguageCubit>().local,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              // theme: ThemeData.dark().copyWith(
              //   scaffoldBackgroundColor: Color(0xFF0A0E21),
              //   primaryColor: Color(0xFF0A0E21),
              //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
              // ),
              home:Splashscreen(),
          );
        },
      ),
    );
  }
}
