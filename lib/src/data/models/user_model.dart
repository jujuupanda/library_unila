class UserModel {
  UserModel({
      this.id, 
      this.fName, 
      this.lName, 
      this.addr, 
      this.eMail, 
      this.phone, 
      this.pwd,});

  UserModel.fromJson(dynamic json) {
    id = json['ID'];
    fName = json['FName'];
    lName = json['LName'];
    addr = json['Addr'];
    eMail = json['EMail'];
    phone = json['Phone'];
    pwd = json['Pwd'];
  }
  String? id;
  String? fName;
  String? lName;
  String? addr;
  String? eMail;
  String? phone;
  String? pwd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['FName'] = fName;
    map['LName'] = lName;
    map['Addr'] = addr;
    map['EMail'] = eMail;
    map['Phone'] = phone;
    map['Pwd'] = pwd;
    return map;
  }

}