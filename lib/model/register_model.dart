class RegisterModel {
  bool? status;
  String? errNum;
  String? msg;
  User? user;

  RegisterModel({this.status, this.errNum, this.msg, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['errNum'] = errNum;
    data['msg'] = msg;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  int? id;
  String? apiToken;

  User({this.name, this.email, this.id, this.apiToken});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    data['api_token'] = apiToken;
    return data;
  }
}