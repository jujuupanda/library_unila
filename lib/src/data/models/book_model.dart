class BookModel {
  BookModel({
    this.titId,
    this.titKey,
    this.eTitBib,
  });

  BookModel.fromJson(dynamic json) {
    titId = json['TitId'];
    titKey = json['TitKey'];
    eTitBib =
        json['ETitBib'] != null ? ETitBib.fromJson(json['ETitBib']) : null;
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
    this.eBib,
  });

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
    this.eIdn,
  });

  EBib.fromJson(dynamic json) {
    bibId = json['BibId'];
    calKey = json['CalKey'];
    ediRaw = json['EdiRaw'];
    pubRaw = json['PubRaw'];
    eIdn = json['EIdn'] != null ? EIdn.fromJson(json['EIdn']) : null;
  }

  int? bibId;
  String? calKey;
  String? ediRaw;
  String? pubRaw;
  EIdn? eIdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BibId'] = bibId;
    map['CalKey'] = calKey;
    map['EdiRaw'] = ediRaw;
    map['PubRaw'] = pubRaw;
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
    this.idnKey,
  });

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
