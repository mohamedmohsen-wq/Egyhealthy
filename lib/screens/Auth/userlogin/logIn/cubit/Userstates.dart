

import 'package:egyhealthcare/hos_model/hospitalloginmodel.dart';

import '../../../../../model/login_model2.dart';

abstract class UserLoginStates{}

class UserLoginInitialState extends UserLoginStates{}

class UserLoginDataSuccessState extends UserLoginStates{
  final LoginModel2 loginModel;
  UserLoginDataSuccessState(this.loginModel);


}

class UserLoginDataErrorState extends UserLoginStates{}

class UserLoginDataLoadingState extends UserLoginStates{}

class UserSuffixVisibilityState extends UserLoginStates{}

