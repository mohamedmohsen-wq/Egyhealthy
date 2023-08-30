class ReservationsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Reservations>? reservations;

  ReservationsModel({this.status, this.errNum, this.msg, this.reservations});

  ReservationsModel.fromJson(Map<String, dynamic> json) {
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
  Null? doctorId;
  int? hospitalId;
  Null? roomId;
  int? clincalId;
  String? date;
  Null? time;
  String? status;
  Null? name;
  Null? nationalId;
  Null? phone;
  String? createdAt;
  String? updatedAt;
  int? nORIH;
  int? nORIC;
  User? user;
  Clincal? clincal;
  Hospital? hospital;
  Null? room;
  Null? doctor;

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
        this.nORIH,
        this.nORIC,
        this.user,
        this.clincal,
        this.hospital,
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
    nORIH = json['NORIH'];
    nORIC = json['NORIC'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    clincal =
    json['clincal'] != null ? new Clincal.fromJson(json['clincal']) : null;
    hospital = json['hospital'] != null
        ? new Hospital.fromJson(json['hospital'])
        : null;
    room = json['room'];
    doctor = json['doctor'];
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
    data['NORIH'] = this.nORIH;
    data['NORIC'] = this.nORIC;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.clincal != null) {
      data['clincal'] = this.clincal!.toJson();
    }
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.toJson();
    }
    data['room'] = this.room;
    data['doctor'] = this.doctor;
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

class Hospital {
  int? id;
  String? name;
  String? address;
  int? rooms;
  int? intensiveCare;
  int? quarantineRooms;
  String? emergencyDays;
  String? city;
  String? clincals;

  Hospital(
      {this.id,
        this.name,
        this.address,
        this.rooms,
        this.intensiveCare,
        this.quarantineRooms,
        this.emergencyDays,
        this.city,
        this.clincals});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    rooms = json['rooms'];
    intensiveCare = json['intensive_care'];
    quarantineRooms = json['quarantine_rooms'];
    emergencyDays = json['emergency_days'];
    city = json['city'];
    clincals = json['clincals'];
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
    return data;
  }
}
