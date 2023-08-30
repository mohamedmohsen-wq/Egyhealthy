class SearchModel {
  bool? status;
  String? errNum;
  String ?msg;
  List<Hospitalsn>? hospitalsn;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['hospitals'] != null) {
      List<Hospitalsn> hospitalsn = [];
      json['hospitals'].forEach((v) {
        hospitalsn.add(Hospitalsn.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['errNum'] = errNum;
    data['msg'] = msg;
    if (hospitalsn == null) {
      data['hospitals'] = hospitalsn!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Hospitalsn {
  int? id;
  String? name;
  String? address;
  int? rooms;
  int? intensiveCare;
  int? quarantineRooms;
  String? emergencyDays;
  String ?city;
  String? clincals;

   Hospitalsn({
    required this.id,
    required this.name,
    required this.address,
    required this.rooms,
    required this.intensiveCare,
    required this.quarantineRooms,
    required this.emergencyDays,
    required this.city,
    required this.clincals,
  });
   Hospitalsn.fromJson(Map<String, dynamic> json) {
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
    return data;
  }

}
