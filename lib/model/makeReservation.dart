class MakeReservationsModel {
  bool? status;
  String? errNum;
  String? msg;
  Reservation? reservation;

  MakeReservationsModel({this.status, this.errNum, this.msg, this.reservation});

  MakeReservationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    reservation = json['reservation'] != null
        ? new Reservation.fromJson(json['reservation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    return data;
  }
}

class Reservation {
  int? userId;
  String? date;
  int? clincalId;
  String? hospitalId;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? nORIH;
  int? nORIC;

  Reservation(
      {this.userId,
        this.date,
        this.clincalId,
        this.hospitalId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.nORIH,
        this.nORIC});

  Reservation.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    clincalId = json['clincal_id'];
    hospitalId = json['hospital_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    nORIH = json['NORIH'];
    nORIC = json['NORIC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['clincal_id'] = this.clincalId;
    data['hospital_id'] = this.hospitalId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['NORIH'] = this.nORIH;
    data['NORIC'] = this.nORIC;
    return data;
  }
}
