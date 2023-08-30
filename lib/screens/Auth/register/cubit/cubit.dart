import 'package:bloc/bloc.dart';
import 'package:egyhealthcare/screens/Auth/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/register_model.dart';
import '../../../../network/remote/dio_helper.dart';
import '../../../../network/remote/end_points.dart';

class RegisterCubit extends  Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());

  RegisterCubit get(context)=> BlocProvider.of(context);


  IconData suffixIcon = Icons.visibility;

  bool isObscure = true;

  changeSuffixVisibility()
  {
    isObscure =!isObscure;
    if(isObscure){
      suffixIcon = Icons.visibility;
    }else{
      suffixIcon = Icons.visibility_off;
    }
    emit(SuffixVisibilityRegisterState());
  }

  RegisterModel? registerModel;
  postRegisterData({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
})
  {
    emit(RegisterDataLoadingState());
    DioHelper.postData(REGISTER, data: {
      'name':name,
      'email':email,
      'password':password,
      'password_confirmation':confirmPassword,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel!.msg);
      emit(RegisterDataSuccessState(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterDataErrorState());
    });
  }
}