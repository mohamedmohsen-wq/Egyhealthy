class AddDoctorModel {
  bool? status;
  String? errNum;
  String? msg;
  Doctor? doctor;

  AddDoctorModel({this.status, this.errNum, this.msg, this.doctor});

  AddDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

class Doctor {
  String? name;
  String? nationalId;
  String? phone;
  String? specialty;
  String? presenceDays;
  int? hospitalId;
  int? clincalId;
  String? image;
  int? id;

  Doctor(
      {this.name,
        this.nationalId,
        this.phone,
        this.specialty,
        this.presenceDays,
        this.hospitalId,
        this.clincalId,
        this.image,
        this.id});

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nationalId = json['national_id'];
    phone = json['phone'];
    specialty = json['specialty'];
    presenceDays = json['presence_days'];
    hospitalId = json['hospital_id'];
    clincalId = json['clincal_id'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['national_id'] = this.nationalId;
    data['phone'] = this.phone;
    data['specialty'] = this.specialty;
    data['presence_days'] = this.presenceDays;
    data['hospital_id'] = this.hospitalId;
    data['clincal_id'] = this.clincalId;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
