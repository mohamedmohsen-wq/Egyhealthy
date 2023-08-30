import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalcubit.dart';
import 'package:egyhealthcare/screens/Auth/register/Register.dart';
import 'package:egyhealthcare/screens/Auth/register/cubit/cubit.dart';
import 'package:egyhealthcare/screens/Auth/userlogin/logIn/login.dart';
import 'package:egyhealthcare/screens/hospital/HospitalAppointments/hospitalAppointHistory.dart';
import 'package:egyhealthcare/screens/hospital/doctorsData/add_doctor.dart';
import 'package:egyhealthcare/screens/hospital/reservationDetails/reservationDetails.dart';
import 'package:egyhealthcare/screens/user/home/homepage.dart';
import 'package:egyhealthcare/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'screens/Auth/userlogin/logIn/cubit/UserCubit.dart';
import 'screens/user/search/cubit/searchcubit.dart';
import 'screens/user/search/filter_hospital_list_page.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  userToken = CacheHelper.getData(key: 'api_token');
  username = CacheHelper.getData(key: 'name');
  useremail = CacheHelper.getData(key: 'email');
  reservationId = CacheHelper.getData(key: 'id');
  hospitalToken = CacheHelper.getData(key: 'api_token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AppCubit()
              ..getClinics()
              ..getEmergency()
              ..getReservations()
              ..getLastHospitals()
              ..getHospitalReservations()..getHospitalReservations()),
        BlocProvider(create: (_) => SearchCubit()..getSearch(text: "")),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => UserLoginCubit()),
        BlocProvider(create: (_) => HospitalLoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash_Animated(),
      ),
    );
  }
}
