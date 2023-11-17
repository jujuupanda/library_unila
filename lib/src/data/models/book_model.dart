class BookModel {
  BookModel({
    this.titId,
    this.titKey,
    this.eTitBib,});

  BookModel.fromJson(dynamic json) {
    titId = json['TitId'];
    titKey = json['TitKey'];
    eTitBib = json['ETitBib'] != null ? ETitBib.fromJson(json['ETitBib']) : null;
  }
  int? titId;
  String? titKey;
  ETitBib? eTitBib;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TitId'] = titId;
    map['TitKey'] = titKey;
    if (eTitBib != null) {
      map['ETitBib'] = eTitBib?.toJson();
    }
    return map;
  }

}

class ETitBib {
  ETitBib({
    this.tBBibId,
    this.eBib,});

  ETitBib.fromJson(dynamic json) {
    tBBibId = json['TBBibId'];
    eBib = json['EBib'] != null ? EBib.fromJson(json['EBib']) : null;
  }
  int? tBBibId;
  EBib? eBib;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TBBibId'] = tBBibId;
    if (eBib != null) {
      map['EBib'] = eBib?.toJson();
    }
    return map;
  }

}

class EBib {
  EBib({
    this.bibId,
    this.calKey,
    this.ediRaw,
    this.pubRaw,
    this.eAutBib,
    this.eIdn,});

  EBib.fromJson(dynamic json) {
    bibId = json['BibId'];
    calKey = json['CalKey'];
    ediRaw = json['EdiRaw'];
    pubRaw = json['PubRaw'];
    eAutBib = json['EAutBib'] != null ? EAutBib.fromJson(json['EAutBib']) : null;
    eIdn = json['EIdn'] != null ? EIdn.fromJson(json['EIdn']) : null;
  }
  int? bibId;
  String? calKey;
  String? ediRaw;
  String? pubRaw;
  EAutBib? eAutBib;
  EIdn? eIdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BibId'] = bibId;
    map['CalKey'] = calKey;
    map['EdiRaw'] = ediRaw;
    map['PubRaw'] = pubRaw;
    if (eAutBib != null) {
      map['EAutBib'] = eAutBib?.toJson();
    }
    if (eIdn != null) {
      map['EIdn'] = eIdn?.toJson();
    }
    return map;
  }

}

class EIdn {
  EIdn({
    this.idnBibId,
    this.idnId,
    this.idnKey,});

  EIdn.fromJson(dynamic json) {
    idnBibId = json['IdnBibId'];
    idnId = json['IdnId'];
    idnKey = json['IdnKey'];
  }
  int? idnBibId;
  int? idnId;
  String? idnKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IdnBibId'] = idnBibId;
    map['IdnId'] = idnId;
    map['IdnKey'] = idnKey;
    return map;
  }

}

class EAutBib {
  EAutBib({
    this.aBAutId,
    this.eAut,});

  EAutBib.fromJson(dynamic json) {
    aBAutId = json['ABAutId'];
    eAut = json['EAut'] != null ? EAut.fromJson(json['EAut']) : null;
  }
  int? aBAutId;
  EAut? eAut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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