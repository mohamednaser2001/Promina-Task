
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:promina_task/src/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/login_request_model.dart';
import '../data/repos/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginRepo) : super(LoginInitialState());

  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  // check if the inputs are null.
  void validateInputsAndLogin() {
    if (formKey.currentState!.validate()) {
      login();
    }
  }


  void login()async {
    emit(LoginLoadingState());

    final response = await _loginRepo.login(
        LoginRequestModel(email: emailController.text.trim(),
            password: passwordController.text.trim()));

    response.when(success: (userData)async {
      await storeDataLocally(userData);
      emit(LoginSuccessState());
    }, failure: (error) {
      emit(LoginErrorState(error.message??''));
    });
  }


  Future<void> storeDataLocally(UserDataModel userData)async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userData.token);
    await sharedPreferences.setString('name', userData.user.name);
    await sharedPreferences.setString('email', userData.user.email);
    await sharedPreferences.setInt('id', userData.user.id);
  }

}
