import 'package:flutter/material.dart';

const kPrimarycolor = Color(0xff01b3bc);
const kSeconderycolor = Color(0xffFFFFFF);
String? userToken;
String? hospitalToken;
num hospitalId=1;
int? reservationId;
int? reservationId1;
String? initialId;
String? username;
String? useremail;

var tokenController=TextEditingController();
String? reserMonth;
String reject='http://egyhealthh.onlinewebshop.net/api/hospital/rejectReservation/$initialId';