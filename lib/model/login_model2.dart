class LoginModel2 {
  Headers? headers;
  Original? original;
  String? exception;


  LoginModel2.fromJson(Map<String, dynamic> json) {
    headers = json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (original != null) {
      data['original'] = original!.toJson();
    }
    data['exception'] = exception;
    return data;
  }
}

class Headers {


  Headers();

Headers.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
return data;
}
}

class Original {
bool? status;
String? errNum;
String? msg;
User? user;

Original({this.status, this.errNum, this.msg, this.user});

Original.fromJson(Map<String, dynamic> json) {
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
int? id;
String? name;
String? email;
Null? emailVerifiedAt;
Null? image;
String? apiToken;

User({this.id, this.name, this.email, this.emailVerifiedAt, this.image, this.apiToken});

User.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
email = json['email'];
emailVerifiedAt = json['email_verified_at'];
image = json['image'];
apiToken = json['api_token'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['name'] = name;
data['email'] = email;
data['email_verified_at'] = emailVerifiedAt;
data['image'] = image;
data['api_token'] = apiToken;
return data;
}
}