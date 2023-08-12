import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/log_sign/features/create_account/create_account_screen.dart';
import 'package:iti_projects/log_sign/features/login/cubit/login_cubit.dart';
import 'package:iti_projects/log_sign/features/social_wid.dart';
import 'package:iti_projects/log_sign/widget/build_btn.dart';
import 'package:iti_projects/style/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///Validation
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool isLoading = false;

  void _togglePasswordText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Capture2.PNG',),

                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _textFieldTitle("Email"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      validator: (value) {
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "enter you email",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 16,
                          child: Icon(
                            Icons.alternate_email_rounded,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ),
                        border: _buildOutlineInputBorder(),
                        focusedBorder: _buildOutlineInputBorder(),
                        enabledBorder: _buildOutlineInputBorder(),
                        errorBorder: _buildOutlineInputBorder(),
                        disabledBorder: _buildOutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _textFieldTitle("Password"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: obscureText,
                      validator: (value) {
                        if (_passwordController.text.length < 6) {
                          return "Password should be more than 6 characters";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "enter your password",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        prefixIcon: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 16,
                          child: Icon(
                            Icons.lock,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordText,
                          child: Icon(
                            obscureText
                                ? CupertinoIcons.eye_fill
                                : CupertinoIcons.eye_slash_fill,
                            color: Colors.grey[500],
                          ),
                        ),
                        fillColor: Colors.grey[200],
                        border: _buildOutlineInputBorder(),
                        focusedBorder: _buildOutlineInputBorder(),
                        enabledBorder: _buildOutlineInputBorder(),
                        errorBorder: _buildOutlineInputBorder(),
                        disabledBorder: _buildOutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forget Password?"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return buildButton(
                          text: "Login",
                          textColor: Colors.white,
                          btnColor: secondaryColor,
                          onTap: () async {
                            if (_form.currentState!.validate()) {
                              await context.read<LoginCubit>().login(
                                  email: _phoneController.text,
                                  password: _passwordController.text);
                            }

                            // Get.offAll(MainScreen());
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    social_wid(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t Have Account?",
                          style: TextStyle(
                            color: Color(0xFF8B8B97),
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required String name,
    required String image,
    required Color color,
  }) {
    return Container(
      width: 174,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(7),
    );
  }

  Widget _textFieldTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

/// Stateless & stateful
/// Ui : Container , SizeBox , Row , Column .......
/// Navigation
/// Packages & plugin
/// Validation TextField
/// MVC : MODEL - View- Controller

/// Database

/// Localization ( Translations )

/// State Management ( Provider , Bloc , getx , mob , riverpod ),
///

/// SharedPrefernce
/// Restful Api
