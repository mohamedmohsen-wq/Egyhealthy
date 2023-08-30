class GetDoctorModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Doctors>? doctors;

  GetDoctorModel({this.status, this.errNum, this.msg, this.doctors});

  GetDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Doctors'] != null) {
      doctors = <Doctors>[];
      json['Doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.doctors != null) {
      data['Doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  String? name;
  int? phone;
  String? specialty;
  int? hospitalId;
  int? clincalId;
  String? presenceDays;
  int? nationalId;
  String? image;
  Clincal? clincal;

  Doctors(
      {this.id,
        this.name,
        this.phone,
        this.specialty,
        this.hospitalId,
        this.clincalId,
        this.presenceDays,
        this.nationalId,
        this.image,
        this.clincal});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    specialty = json['specialty'];
    hospitalId = json['hospital_id'];
    clincalId = json['clincal_id'];
    presenceDays = json['presence_days'];
    nationalId = json['national_id'];
    image = json['image'];
    clincal =
    json['clincal'] != null ? new Clincal.fromJson(json['clincal']) : null;
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
    if (this.clincal != null) {
      data['clincal'] = this.clincal!.toJson();
    }
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
