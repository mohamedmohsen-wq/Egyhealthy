
import 'package:egyhealthcare/hos_model/hospital_model.dart';
import 'package:egyhealthcare/model/search_n.dart';


abstract class SearchStates{}
class SearchInitialState extends SearchStates{}

class GetSearchSuccessState extends SearchStates{
   SearchModel? searchModel;


  GetSearchSuccessState(this.searchModel);}
class GetSearchErrorState extends SearchStates{
  GetSearchErrorState(error);
}

class GetSearchLoadingState extends SearchStates{}
class GetHospitalDataSuccessState extends SearchStates{
  HospitalModel ? hospitalModel;


  GetHospitalDataSuccessState(this.hospitalModel);
}

class GetHospitalDataErrorState extends SearchStates{


}

class GetHospitalDataLoadingState extends SearchStates{}
