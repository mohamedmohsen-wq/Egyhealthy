class ClinicsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Clincals>? clincals;

  ClinicsModel({this.status, this.errNum, this.msg, this.clincals});

  ClinicsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['clincals'] != null) {
      clincals = <Clincals>[];
      json['clincals'].forEach((v) {
        clincals!.add(new Clincals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.clincals != null) {
      data['clincals'] = this.clincals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clincals {
  int? id;
  String? name;
  int? hospitalId;
  List<Doctor>? doctor;

  Clincals({this.id, this.name, this.hospitalId, this.doctor});

  Clincals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hospitalId = json['hospital_id'];
    if (json['doctor'] != null) {
      doctor = <Doctor>[];
      json['doctor'].forEach((v) {
        doctor!.add(new Doctor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hospital_id'] = this.hospitalId;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.map((v) => v.toJson()).toList();
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
