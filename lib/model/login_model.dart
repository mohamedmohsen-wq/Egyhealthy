class LoginModel
{
  bool? status;
  String? message;
  LoginDataModel? data;

  LoginModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data']== null? null:LoginDataModel.fromJson(json['data']);
  }
}

class LoginDataModel
{
  int? id;
  String? name;
  String? phone;
  String? image;
  String? token;

  LoginDataModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
  }
}