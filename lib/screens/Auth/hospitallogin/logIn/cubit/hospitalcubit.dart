import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../hos_model/hospitalloginmodel.dart';
import '../../../../../network/remote/dio_helper.dart';

class HospitalLoginCubit extends Cubit<HospitalLoginStates> {

  HospitalLoginCubit() :super(HospitalLoginInitialState());

  HospitalLoginCubit get(context) => BlocProvider.of(context);

  IconData hospitalSuffixIcon = Icons.visibility;

  bool hospitalIsObscure = true;

  changeHospitalSuffixVisibility() {
    hospitalIsObscure = !hospitalIsObscure;
    if (hospitalIsObscure) {
      hospitalSuffixIcon = Icons.visibility;
    } else {
      hospitalSuffixIcon = Icons.visibility_off;
    }
    emit(HospitalSuffixVisibilityState());
  }
  HospitalLoginModel? hosLoginModel;
  postHospitalLoginData({
    required String name,
    required String password,
  }){
    emit(HospitalLoginDataLoadingState());

    DioHelper.postData("http://egyhealthh.onlinewebshop.net/api/hospital/login", data: {
      'name':name,
      'password':password,
    }).then((value)
    {
      hosLoginModel = HospitalLoginModel.fromJson(value.data);
      emit(HospitalLoginDataSuccessState(hosLoginModel!));
    }).catchError((error){
      print('this is my status${error.toString()}');
      print(error.toString());
      emit(HospitalLoginDataErrorState());
    });
  }

}