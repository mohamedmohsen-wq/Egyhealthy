import 'package:egyhealthcare/hos_model/accept_reservation_model.dart';
import 'package:egyhealthcare/hos_model/add_doctor_model.dart';
import 'package:egyhealthcare/hos_model/clinics_model.dart';
import 'package:egyhealthcare/hos_model/doctor_data_model.dart';
import 'package:egyhealthcare/hos_model/emergencycases_model.dart';
import 'package:egyhealthcare/hos_model/hospital_model.dart';
import 'package:egyhealthcare/hos_model/reject_reservation_model.dart';
import 'package:egyhealthcare/hos_model/reservations_Model.dart';
import 'package:egyhealthcare/model/makeReservation.dart';
import 'package:egyhealthcare/model/reservations_model.dart';

import '../model/home_model.dart';
import '../model/search_n.dart';

abstract class AppStates{}
class HospitalInitialState extends AppStates{}
class ChangeBottomNav extends AppStates{}
class ChangeDoctorDataNav extends AppStates{}
class ChangeHospitalBottomNav extends AppStates{}
class ChangeLogInNav extends AppStates{}

class GetHospitalDataSuccessState extends AppStates{
  HospitalModel ? hospitalModel;


  GetHospitalDataSuccessState(this.hospitalModel);
}

class GetHospitalDataErrorState extends AppStates{


}

class GetHospitalDataLoadingState extends AppStates{}



class GetReservationsDataSuccessState extends AppStates{
  ReservationsModel ? reservationsModel;


  GetReservationsDataSuccessState(this.reservationsModel);
}

class GetReservationsDataErrorState extends AppStates{


}

class GetReservationsDataLoadingState extends AppStates{}



class GetEmergencyDataSuccessState extends AppStates{
  EmergencyCasesModel ? emergencyCasesModel;


  GetEmergencyDataSuccessState(this.emergencyCasesModel);
}

class GetEmergencyDataErrorState extends AppStates{


}

class GetEmergencyDataLoadingState extends AppStates{}


class GetCilincsDataSuccessState extends AppStates{
  ClinicsModel ? clinicsModel;


  GetCilincsDataSuccessState(this.clinicsModel);
}

class GetCilincsDataErrorState extends AppStates{


}

class GetCilincsDataLoadingState extends AppStates{}



class GetHospitalReservationDataSuccessState extends AppStates{
  HospitalReservationModel ? hospitalReservationModel;


  GetHospitalReservationDataSuccessState(this.hospitalReservationModel);
}

class GetHospitalReservationDataErrorState extends AppStates{


}

class GetHospitalReservationDataLoadingState extends AppStates{}


class MakeReservationDataSuccessState extends AppStates{
 final MakeReservationsModel  makeReservationModel;


  MakeReservationDataSuccessState(this.makeReservationModel);
}
class MakeReservationDataErrorState extends AppStates{


}
class MakeReservationDataLoadingState extends AppStates{}



class MakeReservationDataSuccessState1 extends AppStates{


  MakeReservationDataSuccessState1();
}
class MakeReservationDataErrorState1 extends AppStates{


}
class MakeReservationDataLoadingState1 extends AppStates{}




class UpdateProfileSuccessState extends AppStates{}

class UpdateProfileErrorState extends AppStates{}

class GetDoctorLoadingState extends AppStates{}


class GetDoctorSuccessState extends AppStates{
  GetDoctorModel? getDoctorModel;
  GetDoctorSuccessState(this.getDoctorModel);
}

class GetDoctorErrorState extends AppStates{}


class GetReservationAcceptedLoadingState extends AppStates{}

class GetReservationAcceptedSuccessState extends AppStates{
  AcceptReservationModel? acceptReservationModel;
  GetReservationAcceptedSuccessState(this.acceptReservationModel);

}

class GetReservationAcceptedErrorState extends AppStates{}



class GetReservationRejectedLoadingState extends AppStates{}

class GetReservationRejectedSuccessState extends AppStates{
 final RejectReservationModel rejectReservationModel;
  GetReservationRejectedSuccessState(this.rejectReservationModel);
}

class GetReservationRejectedErrorState extends AppStates{}

class AddDoctorSuccessState extends AppStates{
  final AddDoctorModel addDoctorModel;

  AddDoctorSuccessState(this.addDoctorModel);
}
class AddDoctorLoadingState extends AppStates{}
class AddDoctorErrorState extends AppStates{}

