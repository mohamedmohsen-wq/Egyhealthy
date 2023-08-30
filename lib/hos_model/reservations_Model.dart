class HospitalReservationModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Reservations>? reservations;

  HospitalReservationModel(
      {this.status, this.errNum, this.msg, this.reservations});

  HospitalReservationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Reservations'] != null) {
      reservations = <Reservations>[];
      json['Reservations'].forEach((v) {
        reservations!.add(new Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.reservations != null) {
      data['Reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reservations {
  int? id;
  int? userId;
  int? doctorId;
  int? hospitalId;
  int? roomId;
  int? clincalId;
  String? date;
  String? time;
  String? status;
  Null? name;
  Null? nationalId;
  Null? phone;
  String? createdAt;
  String? updatedAt;
  User? user;
  Clincal? clincal;
  Room? room;
  Doctor? doctor;

  Reservations(
      {this.id,
        this.userId,
        this.doctorId,
        this.hospitalId,
        this.roomId,
        this.clincalId,
        this.date,
        this.time,
        this.status,
        this.name,
        this.nationalId,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.clincal,
        this.room,
        this.doctor});

  Reservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    hospitalId = json['hospital_id'];
    roomId = json['room_id'];
    clincalId = json['clincal_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    name = json['name'];
    nationalId = json['national_id'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    clincal =
    json['clincal'] != null ? new Clincal.fromJson(json['clincal']) : null;
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['hospital_id'] = this.hospitalId;
    data['room_id'] = this.roomId;
    data['clincal_id'] = this.clincalId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['name'] = this.name;
    data['national_id'] = this.nationalId;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.clincal != null) {
      data['clincal'] = this.clincal!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? image;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
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

class Room {
  int? id;
  int? number;
  int? floor;
  int? hospitalId;
  int? status;
  Null? createdAt;
  String? updatedAt;

  Room(
      {this.id,
        this.number,
        this.floor,
        this.hospitalId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    floor = json['floor'];
    hospitalId = json['hospital_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['floor'] = this.floor;
    data['hospital_id'] = this.hospitalId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Null? image;

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
