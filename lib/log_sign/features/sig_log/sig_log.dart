import 'package:flutter/material.dart';
import 'package:iti_projects/log_sign/features/create_account/create_account_screen.dart';
import 'package:iti_projects/log_sign/features/login/login_screen.dart';

class home_log_sig_screen extends StatefulWidget {
  const home_log_sig_screen({super.key});

  @override
  State<home_log_sig_screen> createState() => _home_log_sig_screenState();
}

class _home_log_sig_screenState extends State<home_log_sig_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/Capture1.PNG",width: 250,height: 250,),
              Padding(
                padding: const EdgeInsets.all(58.0),
                child: Text("Welcome to Lablysis App for medical analysis",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6E73D1), fontSize: 32,fontWeight: FontWeight.bold ,letterSpacing: 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));

                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue, // your color here
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),


        ),
      ),

    );
  }
}
