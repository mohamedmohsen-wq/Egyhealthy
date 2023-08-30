
import '../../../../../hos_model/hospitalloginmodel.dart';

abstract class HospitalLoginStates{}

class HospitalLoginInitialState extends HospitalLoginStates{}

class HospitalLoginDataSuccessState extends HospitalLoginStates{
  final HospitalLoginModel hosLoginModel;
  HospitalLoginDataSuccessState(this.hosLoginModel);


}

class HospitalLoginDataErrorState extends HospitalLoginStates{}

class HospitalLoginDataLoadingState extends HospitalLoginStates{}

class HospitalSuffixVisibilityState extends HospitalLoginStates{}