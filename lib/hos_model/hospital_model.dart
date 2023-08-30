class HospitalModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Hospitals>? hospitals;

  HospitalModel({this.status, this.errNum, this.msg, this.hospitals});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['hospitals'] != null) {
      hospitals = <Hospitals>[];
      json['hospitals'].forEach((v) {
        hospitals!.add(new Hospitals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.hospitals != null) {
      data['hospitals'] = this.hospitals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hospitals {
  int? id;
  String? name;
  String? address;
  int? rooms;
  int? intensiveCare;
  int? quarantineRooms;
  String? emergencyDays;
  String? city;
  String? clincals;
  String? emergency;
  List<Doctor>? doctor;
  List<Clincal>? clincal;

  Hospitals(
      {this.id,
        this.name,
        this.address,
        this.rooms,
        this.intensiveCare,
        this.quarantineRooms,
        this.emergencyDays,
        this.city,
        this.clincals,
        this.emergency,
        this.doctor,
        this.clincal});

  Hospitals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    rooms = json['rooms'];
    intensiveCare = json['intensive_care'];
    quarantineRooms = json['quarantine_rooms'];
    emergencyDays = json['emergency_days'];
    city = json['city'];
    clincals = json['clincals'];
    emergency = json['emergency'];
    if (json['doctor'] != null) {
      doctor = <Doctor>[];
      json['doctor'].forEach((v) {
        doctor!.add(new Doctor.fromJson(v));
      });
    }
    if (json['clincal'] != null) {
      clincal = <Clincal>[];
      json['clincal'].forEach((v) {
        clincal!.add(new Clincal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['rooms'] = this.rooms;
    data['intensive_care'] = this.intensiveCare;
    data['quarantine_rooms'] = this.quarantineRooms;
    data['emergency_days'] = this.emergencyDays;
    data['city'] = this.city;
    data['clincals'] = this.clincals;
    data['emergency'] = this.emergency;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.map((v) => v.toJson()).toList();
    }
    if (this.clincal != null) {
      data['clincal'] = this.clincal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  int? phone;
  String? specialty;
  int? hospitalId;
  int? clincalId;
  String? presenceDays;
  int? nationalId;
  String? image;

  Doctor(
      {this.id,
        this.name,
        this.phone,
        this.specialty,
        this.hospitalId,
        this.clincalId,
        this.presenceDays,
        this.nationalId,
        this.image});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    specialty = json['specialty'];
    hospitalId = json['hospital_id'];
    clincalId = json['clincal_id'];
    presenceDays = json['presence_days'];
    nationalId = json['national_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['specialty'] = this.specialty;
    data['hospital_id'] = this.hospitalId;
    data['clincal_id'] = this.clincalId;
    data['presence_days'] = this.presenceDays;
    data['national_id'] = this.nationalId;
    data['image'] = this.image;
    return data;
  }
}

class Clincal {
  int? id;
  String? name;
  int? hospitalId;

  Clincal({this.id, this.name, this.hospitalId});

  Clincal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hospitalId = json['hospital_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hospital_id'] = this.hospitalId;
    return data;
  }
}