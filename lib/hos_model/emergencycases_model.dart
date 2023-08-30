class EmergencyCasesModel {
  bool? status;
  String? errNum;
  String? msg;
  List<EmergencyCases>? emergencyCases;

  EmergencyCasesModel({this.status, this.errNum, this.msg, this.emergencyCases});

  EmergencyCasesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Emergency_cases'] != null) {
      emergencyCases = <EmergencyCases>[];
      json['Emergency_cases'].forEach((v) {
        emergencyCases!.add(new EmergencyCases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.emergencyCases != null) {
      data['Emergency_cases'] =
          this.emergencyCases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmergencyCases {
  int? id;
  int? userId;
  int? hospitalId;
  String? createdAt;
  String? updatedAt;
  UserInfo? userInfo;
  User? user;

  EmergencyCases(
      {this.id,
        this.userId,
        this.hospitalId,
        this.createdAt,
        this.updatedAt,
        this.userInfo,
        this.user});

  EmergencyCases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hospitalId = json['hospital_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['hospital_id'] = this.hospitalId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? phone;
  int? nationalId;

  UserInfo({this.phone, this.nationalId});

  UserInfo.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    nationalId = json['national_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['national_id'] = this.nationalId;
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
