import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:v_care_app/core/networking/remote/endpoints.dart';

import '../../../../core/networking/remote/DioHelper.dart';
import '../../data/models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  bool isMaleChecked=false;
  bool isFemaleChecked=false;
  String selectedGender = "";

  changeCheckBoxOfMale(checked){
    isMaleChecked= checked;
    isFemaleChecked= false;
    selectedGender = "0";
    emit(ChangeGenderState());
  }

  changeCheckBoxOfFemale(checked){
    isFemaleChecked= checked;
    isMaleChecked = false;
    selectedGender = "1";
    emit(ChangeGenderState());
  }

  RegisterModel? registerModel;
  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) {
    emit(RegisterLoadingState());
    DioHelper.PostData(url: registerUrl, data: {
      'name' : name,
      'email': email,
      'phone' : phone,
      'password': password,
      'password_confirmation' : passwordConfirmation,
      'gender' : selectedGender
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      //print(loginModel?.token);
      //print(loginModel?.data?.id);
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility(){
    isPassword =!  isPassword;

    suffix=isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());

  }
}
