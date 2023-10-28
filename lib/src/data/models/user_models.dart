class UserModels {
  UserModels({
      this.id, 
      this.npm, 
      this.name, 
      this.email, 
      this.address, 
      this.password, 
      this.phone, 
      this.createdAt,});

  UserModels.fromJson(dynamic json) {
    id = json['id'];
    npm = json['npm'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    phone = json['phone'];
    createdAt = json['createdAt'];
  }
  int? id;
  String? npm;
  String? name;
  String? email;
  String? address;
  String? password;
  String? phone;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['npm'] = npm;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['password'] = password;
    map['phone'] = phone;
    map['createdAt'] = createdAt;
    return map;
  }

}