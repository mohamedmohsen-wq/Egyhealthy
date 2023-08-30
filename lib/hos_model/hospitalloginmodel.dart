class HospitalLoginModel {
  Headers? headers;
  Original? original;
  String? exception;

  HospitalLoginModel({this.headers, this.original, this.exception});

  HospitalLoginModel.fromJson(Map<String, dynamic> json) {
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
Hospital? hospital;

Original({this.status, this.errNum, this.msg, this.hospital});

Original.fromJson(Map<String, dynamic> json) {
status = json['status'];
errNum = json['errNum'];
msg = json['msg'];
hospital = json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['status'] = status;
data['errNum'] = errNum;
data['msg'] = msg;
if (hospital != null) {
data['hospital'] = hospital!.toJson();
}
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
String? apiToken;

Hospital({this.id, this.name, this.address, this.rooms, this.intensiveCare, this.quarantineRooms, this.emergencyDays, this.city, this.clincals, this.apiToken});

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
apiToken = json['api_token'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['name'] = name;
data['address'] = address;
data['rooms'] = rooms;
data['intensive_care'] = intensiveCare;
data['quarantine_rooms'] = quarantineRooms;
data['emergency_days'] = emergencyDays;
data['city'] = city;
data['clincals'] = clincals;
data['api_token'] = apiToken;
return data;
}
}
