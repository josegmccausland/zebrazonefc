class SquadModel {
  int id;
  String name;
  String ccode;
  String cname;
  String role;

  SquadModel({this.id, this.name, this.ccode, this.cname, this.role});

  SquadModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ccode = json['ccode'];
    cname = json['cname'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ccode'] = this.ccode;
    data['cname'] = this.cname;
    data['role'] = this.role;
    return data;
  }
}
