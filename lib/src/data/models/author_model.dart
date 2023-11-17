class AuthorModel {
  AuthorModel({
      this.aBBibId, 
      this.aBAutId, 
      this.eAut,});

  AuthorModel.fromJson(dynamic json) {
    aBBibId = json['ABBibId'];
    aBAutId = json['ABAutId'];
    eAut = json['EAut'] != null ? EAut.fromJson(json['EAut']) : null;
  }
  int? aBBibId;
  int? aBAutId;
  EAut? eAut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ABBibId'] = aBBibId;
    map['ABAutId'] = aBAutId;
    if (eAut != null) {
      map['EAut'] = eAut?.toJson();
    }
    return map;
  }

}

class EAut {
  EAut({
      this.autKey,});

  EAut.fromJson(dynamic json) {
    autKey = json['AutKey'];
  }
  String? autKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AutKey'] = autKey;
    return map;
  }

}