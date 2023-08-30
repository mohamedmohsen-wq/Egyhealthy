import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/hos_model/hospital_model.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/network/remote/end_points.dart';
import 'package:egyhealthcare/screens/user/search/cubit/searchstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {

  SearchCubit() :super(SearchInitialState());

  SearchCubit get(context) => BlocProvider.of(context);
   SearchModel? searchModel;
   Map<String,dynamic>? searchModel1;

   getSearch ({required String text})
  {
    emit(GetSearchLoadingState());
    print("ddddddddddddddddddddddddddddddddddddd");

      DioHelper.postData(

        SEARCH_NAMED,
          query: {"status":true},
          data: {
      'value':text,
    },
         token: userToken).then((z)
    {
      print("ddddddddddddddddddddddddddddddddddddd");

      searchModel1  = z.data??"";


      print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${searchModel!.hospitalsn![0].city.toString()}");
      emit(GetSearchSuccessState(searchModel));
      print("ddddddddddddddddddddddddddddddddddddd");

    }).catchError((error){
        print("ddddddddddddddddddddddddddddddddddddd");
print(error.toString()+"aaaaaaaaaaaaaaa");
        emit(GetSearchErrorState(error.toString()));
    });
  }

  // SearchModel? orders;
  // void getSearch({
  //   required String text,
  //
  //
  // }){
  //   emit(GetSearchLoadingState());
  //   var map=new Map<String, dynamic>();
  //   map['text']=text;
  //
  //
  //
  //
  //   var send=FormData.fromMap(map);
  //
  //   DioHelper.postData( SEARCH_NAMED, data: send,token: userToken)
  //
  //       .then((value) {
  //
  //
  //
  //     var d=value.data ;
  //     print(d.toString()+"dd");
  //
  //     List<dynamic> order2 = json.decode(d).toList();
  //     print("$order2");
  //
  //
  //
  //     for(int i=0;i<order2.length;i++){
  //
  //       List<dynamic> ordertheem =order2[i].toString().split(",");
  //       // print(ordertheem[1]);
  //       int id = ordertheem[0].substring(ordertheem[0].indexOf(":")+1).trim();
  //       //print(id);
  //       String name = ordertheem[1].substring(ordertheem[1].indexOf(":")+1).trim();
  //       print(name+"ssd");
  //       //
  //       String address = ordertheem[2].substring(ordertheem[2].indexOf(":")+1).trim();
  //       // print(details);
  //       //
  //       int intensiveCare = ordertheem[3].substring(ordertheem[3].indexOf(":")+1).trim();
  //       int quarantineRooms = ordertheem[4].substring(ordertheem[4].indexOf(":")+1).trim();
  //       String emergencyDays   = ordertheem[5].substring(ordertheem[5].indexOf(":")+1).trim();
  //       String city = ordertheem[6].substring(ordertheem[6].indexOf(":")+1).trim();
  //       String clincals = ordertheem[7].substring(ordertheem[7].indexOf(":")+1).trim();
  //       //
  //       //
  //
  //       SearchModel Orderdata=Hospitals(id: id,name: name,address: address,intensiveCare: intensiveCare,quarantineRooms: quarantineRooms,emergencyDays: emergencyDays,city: city,clincals: clincals) as SearchModel ;
  //       hospital.add(Orderdata as Hospitalsn );
  //
  //
  //
  //
  //
  //     }
  //
  //
  //
  //
  //
  //
  //     emit(GetSearchSuccessState(searchModel!));
  //
  //
  //
  //
  //
  //
  //
  //   }
  //
  //
  //
  //   ).catchError((error){
  //     print(error.toString());
  //     emit(GetSearchErrorState(error));
  //   });
  //
  //
  //
  //
  // }

}