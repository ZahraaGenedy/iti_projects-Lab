import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:iti_projects/log_sign/features/login/login_screen.dart';
import 'package:iti_projects/log_sign/features/login/model/LoginModel.dart';
 import 'package:iti_projects/log_sign/network/dio_helper.dart';
import 'package:iti_projects/layout/home_layout/home_layout.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  final DioHelper _dioHelper = DioHelper();

  Future createAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(CreateAccountLoading());

    try {
      final Response response = await _dioHelper.postData(
        url: "register",
        body: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
        },
      );


      final loginModel = LoginModel.fromJson(response.data);

      if (loginModel.status == true) {
        Get.Get.offAll(LoginScreen());
        emit(CreateAccountSuccess());
      } else {
        Get.Get.snackbar(
          response.data["message"],
          " Error",
          backgroundColor: Colors.red[200],
        );
        emit(CreateAccountError());
      }
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red[200]);
      emit(CreateAccountError());
    }
  }
}
