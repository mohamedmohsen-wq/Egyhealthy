import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/hos_model/accept_reservation_model.dart';
import 'package:egyhealthcare/hos_model/add_doctor_model.dart';
import 'package:egyhealthcare/hos_model/doctor_data_model.dart';
import 'package:egyhealthcare/hos_model/reject_reservation_model.dart';
import 'package:http/http.dart' as http;
import 'package:egyhealthcare/hos_model/clinics_model.dart';
import 'package:egyhealthcare/hos_model/emergencycases_model.dart';
import 'package:egyhealthcare/hos_model/reservations_Model.dart';
import 'package:egyhealthcare/model/makeReservation.dart';
import 'package:egyhealthcare/model/reservations_model.dart';
import 'package:egyhealthcare/screens/Auth/userlogin/logIn/login.dart';
import 'package:egyhealthcare/screens/hospital/doctorsData/doctorDatabase.dart';
import 'package:egyhealthcare/screens/hospital/Emerg/homepage.dart';
import 'package:egyhealthcare/screens/hospital/HospitalAppointments/hospitalAppointHistory.dart';
import 'package:egyhealthcare/screens/hospital/HospitalStaff/hospitalStaff.dart';
import 'package:egyhealthcare/screens/user/Appointment/Appointmenthistory.dart';
import 'package:egyhealthcare/screens/user/personal/personal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/componnents/constants.dart';
import '../model/home_model.dart';
import '../hos_model/hospital_model.dart';
import '../model/search_n.dart';
import '../network/remote/dio_helper.dart';
import '../network/remote/end_points.dart';
import '../screens/user/findhospital/hospitalsLocation.dart';

class AppCubit extends Cubit<AppStates> {
  static var index;

  AppCubit() : super(HospitalInitialState());

  AppCubit get(context) => BlocProvider.of(context);
  int current = 0;
  int hospitalCurrent = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '__'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '__'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '__'),
  ];
  List<BottomNavigationBarItem> hospitalBottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '__'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '__'),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_hospital_outlined), label: '__'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '__'),
  ];
  Hospitalsn? hospitalsn;

  void ChangeBottomNavBar(int index) {
    current = index;
    if (current == 0) getLastHospitals();
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbb$reservationId');

    if (current == 1) getReservations();
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbb$reservationId');

    emit(ChangeBottomNav());
  }

  void ChangeHospitalBottomNavBar(int i) {
    hospitalCurrent = i;
    if (hospitalCurrent == 0)
      getEmergency();
    getHospitalStaff();
    getHospitalReservations();
    if (hospitalCurrent == 1) getHospitalReservations();
    getHospitalStaff();
    getEmergency();

    print('aaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbb$reservationId');

    if (hospitalCurrent == 2) getClinics();
    getHospitalReservations();
    getEmergency();

    getHospitalStaff();

    print('aaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbb$reservationId');

    emit(ChangeHospitalBottomNav());
  }

  Color colorContainer1 = Color(0xff0277BD);
  Color colorContainer2 = Colors.white.withOpacity(0);

  Color colorText1 = Color(0xff0277BD);
  Color colorText2 = Color(0xff5C5C5C);

  int indexMyOrderScreen = 1;

  void changeIndexMyOrderScreen(int i) {
    indexMyOrderScreen = i;
    emit(ChangeDoctorDataNav());
  }

  List<Widget> screens = [
    HospitalsLocation(),
    AppointmentHistory(),
    Personal()
  ];
  List<Widget> hospitalScreens = [
    HospitalHomePage(),
    HospitalAppointHistory(),
    HospitalStaff(),
    DoctorDatabase()
  ];
  late MakeReservationsModel makeReservationsModel;

  PostReservationData(
      String date
      ) {
    emit(MakeReservationDataLoadingState());

    DioHelper.postData(
            'http://egyhealthh.onlinewebshop.net/api/user/clincalReserve',
            data: {
              'date': date,

              'hospital_id': "1",
              'clincal': '${clinicController.text}',
            },
            token2: userToken)
        .then((value) {
      makeReservationsModel = MakeReservationsModel.fromJson(value.data);
      print(
          'this is my status0000000000000000000000000000000000000000000000000000${makeReservationsModel.reservation?.id}');

      emit(MakeReservationDataSuccessState(makeReservationsModel));
    }).catchError((error) {
      print('this is my status${error.toString()}');
      print(error.toString());
      emit(MakeReservationDataErrorState());
    });
  }

  // requestReservation({required hospital_id}) {
  //   emit(MakeReservationDataLoadingState());
  //   DioHelper.postData(
  //       'http://egyhealthh.onlinewebshop.net/api/user/clincalReserve',
  //       token2: userToken,
  //       data: {
  //         "hospital_id": hospital_id,
  //       }).then((value) {
  //     makeReservationsModel = MakeReservationsModel.fromJson(value.data);
  //     emit(MakeReservationDataSuccessState(makeReservationsModel!));
  //   }).catchError((error) {
  //     print(
  //         '00000000000000000000aaaaaaaaaaaaaaaaaaaaaaaa${error.toString()}aaaaaaaaaaaaaaaaaaaa');
  //   });
  // }

  HospitalModel? hospitalModel;

  getLastHospitals() {
    emit(GetHospitalDataLoadingState());

    DioHelper.getData('http://egyhealthh.onlinewebshop.net/api/user/hospitals',
            query: {
              'status': true,
            },
            token: userToken)
        .then((value) {
      hospitalModel = HospitalModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${hospitalModel!.hospitals![0].name.toString()}");
      emit(GetHospitalDataSuccessState(hospitalModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetHospitalDataErrorState());
    });
  }

  ReservationsModel? reservationsModel;

  getReservations() {
    emit(GetReservationsDataLoadingState());

    DioHelper.getData(
            'http://egyhealthh.onlinewebshop.net/api/user/reservations',
            query: {
              'status': true,
            },
            token: userToken)
        .then((value) {
      reservationsModel = ReservationsModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${reservationsModel!.reservations![0].date.toString()}");
      emit(GetReservationsDataSuccessState(reservationsModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetReservationsDataErrorState());
    });
  }

  EmergencyCasesModel? emergencyCasesModel;

  getEmergency() {
    emit(GetEmergencyDataLoadingState());

    DioHelper.getData(
            'http://egyhealthh.onlinewebshop.net/api/hospital/getEmergencyCases',
            query: {},
            token: hospitalToken)
        .then((value) {
      emergencyCasesModel = EmergencyCasesModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${emergencyCasesModel!.emergencyCases![0].user!.name.toString()}");
      emit(GetEmergencyDataSuccessState(emergencyCasesModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetEmergencyDataErrorState());
    });
  }

  ClinicsModel? clinicsModel;

  getClinics() {
    emit(GetCilincsDataLoadingState());

    DioHelper.getData(
            'http://egyhealthh.onlinewebshop.net/api/hospital/getClincals',
            query: {},
            token: hospitalToken)
        .then((value) {
      clinicsModel = ClinicsModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${clinicsModel!.clincals![0].doctor!.length.toString()}");
      emit(GetCilincsDataSuccessState(clinicsModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetCilincsDataErrorState());
    });
  }

  HospitalReservationModel? hospitalReservationModel;

  getHospitalReservations() {
    emit(GetHospitalReservationDataLoadingState());

    DioHelper.getData(
            'http://egyhealthh.onlinewebshop.net/api/hospital/getReservations',
            query: {
              "status": true,
              "errNum": "200",
            },
            token: hospitalToken)
        .then((value) {
      hospitalReservationModel = HospitalReservationModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${hospitalReservationModel!.reservations![0].user!.name.toString()}");
      emit(GetHospitalReservationDataSuccessState(hospitalReservationModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetHospitalReservationDataErrorState());
    });
  }


  var clinicController = TextEditingController();

  AddDoctorModel?addDoctorModel;
  PostNewDoctorData(

      {
        required String name,
        required String specialty,
        required String presence_days,
      }
      ) {
    emit(AddDoctorLoadingState());

    DioHelper.postData(
            'http://egyhealthh.onlinewebshop.net/api/hospital/createDoctor',
            data: {
              'name':name ,
              'specialty': specialty,
              'presence_days':presence_days,

            },
            token2: hospitalToken)
        .then((value) {
      addDoctorModel = AddDoctorModel.fromJson(value.data);
      print(
          'this is my status0000000000000000000000000000000000000000000000000000${addDoctorModel!.msg.toString()}');

      emit(AddDoctorSuccessState(addDoctorModel!));
    }).catchError((error) {
      print('this is my status${error.toString()}');
      print(error.toString());
      emit(AddDoctorErrorState());
    });
  }
  GetDoctorModel? getDoctorModel;
  getHospitalStaff() {
    emit(GetDoctorLoadingState());

    DioHelper.getData(
        'http://egyhealthh.onlinewebshop.net/api/hospital/getDoctors',
        query: {
          'status': true,
        },
        token: hospitalToken)
        .then((value) {
      getDoctorModel = GetDoctorModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${getDoctorModel!.doctors![0].name.toString()}");
      emit(GetDoctorSuccessState(getDoctorModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetDoctorErrorState());
    });
  }


  AcceptReservationModel?acceptReservationModel;
  getReservationAccepted() {
    emit(GetReservationAcceptedLoadingState());

    DioHelper.getData(
        'http://egyhealthh.onlinewebshop.net/api/hospital/finishClincalReservation/${initialId.toString()}',
        token: hospitalToken)
        .then((value) {
      acceptReservationModel =AcceptReservationModel.fromJson(value.data)  ;
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzz${initialId.toString()}');

          print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${acceptReservationModel!.msg.toString()}");
      emit(GetReservationAcceptedSuccessState(acceptReservationModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetReservationAcceptedErrorState());
    });
  }

  RejectReservationModel?rejectReservationModel;
  getReservationRejected() {
    emit(GetReservationRejectedLoadingState());

    DioHelper.getData(
        'http://egyhealthh.onlinewebshop.net/api/hospital/rejectReservation/${initialId.toString()}',
        token: hospitalToken)
        .then((value) {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzz${initialId.toString()}');
      rejectReservationModel = RejectReservationModel.fromJson(value.data);
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${rejectReservationModel!.errNum.toString()}");
      emit(GetReservationRejectedSuccessState(rejectReservationModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetReservationRejectedErrorState());
    });
  }

}
