class AccountCirculationModel {
  AccountCirculationModel({
    this.id,
    this.itemNo,
    this.chkODate,
    this.fineAmnt,
    this.paidAmnt,
    this.paidDate,
    this.cItem,});

  AccountCirculationModel.fromJson(dynamic json) {
    id = json['ID'];
    itemNo = json['ItemNo'];
    chkODate = json['ChkODate'];
    fineAmnt = json['FineAmnt'];
    paidAmnt = json['PaidAmnt'];
    paidDate = json['PaidDate'];
    cItem = json['CItem'] != null ? CItem.fromJson(json['CItem']) : null;
  }
  String? id;
  String? itemNo;
  String? chkODate;
  int? fineAmnt;
  int? paidAmnt;
  dynamic paidDate;
  CItem? cItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['ItemNo'] = itemNo;
    map['ChkODate'] = chkODate;
    map['FineAmnt'] = fineAmnt;
    map['PaidAmnt'] = paidAmnt;
    map['PaidDate'] = paidDate;
    if (cItem != null) {
      map['CItem'] = cItem?.toJson();
    }
    return map;
  }

}

class CItem {
  CItem({
    this.itemNo,
    this.itemBib,
    this.itemClss,
    this.locaCode,
    this.copyNo,
    this.eBib,
    this.eTitBib,});

  CItem.fromJson(dynamic json) {
    itemNo = json['ItemNo'];
    itemBib = json['ItemBib'];
    itemClss = json['ItemClss'];
    locaCode = json['LocaCode'];
    copyNo = json['CopyNo'];
    eBib = json['EBib'] != null ? EBib.fromJson(json['EBib']) : null;
    eTitBib = json['ETitBib'] != null ? ETitBib.fromJson(json['ETitBib']) : null;
  }
  String? itemNo;
  int? itemBib;
  String? itemClss;
  String? locaCode;
  int? copyNo;
  EBib? eBib;
  ETitBib? eTitBib;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ItemNo'] = itemNo;
    map['ItemBib'] = itemBib;
    map['ItemClss'] = itemClss;
    map['LocaCode'] = locaCode;
    map['CopyNo'] = copyNo;
    if (eBib != null) {
      map['EBib'] = eBib?.toJson();
    }
    if (eTitBib != null) {
      map['ETitBib'] = eTitBib?.toJson();
    }
    return map;
  }

}

class ETitBib {
  ETitBib({
    this.tBBibId,
    this.tBTitId,
    this.eTit,});

  ETitBib.fromJson(dynamic json) {
    tBBibId = json['TBBibId'];
    tBTitId = json['TBTitId'];
    eTit = json['ETit'] != null ? ETit.fromJson(json['ETit']) : null;
  }
  int? tBBibId;
  int? tBTitId;
  ETit? eTit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TBBibId'] = tBBibId;
    map['TBTitId'] = tBTitId;
    if (eTit != null) {
      map['ETit'] = eTit?.toJson();
    }
    return map;
  }

}

class ETit {
  ETit({
    this.titId,
    this.titKey,});

  ETit.fromJson(dynamic json) {
    titId = json['TitId'];
    titKey = json['TitKey'];
  }
  int? titId;
  String? titKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TitId'] = titId;
    map['TitKey'] = titKey;
    return map;
  }

}

class EBib {
  EBib({
    this.bibId,
    this.calKey,
    this.ediRaw,
    this.pubRaw,});

  EBib.fromJson(dynamic json) {
    bibId = json['BibId'];
    calKey = json['CalKey'];
    ediRaw = json['EdiRaw'];
    pubRaw = json['PubRaw'];
  }
  int? bibId;
  String? calKey;
  String? ediRaw;
  String? pubRaw;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BibId'] = bibId;
    map['CalKey'] = calKey;
    map['EdiRaw'] = ediRaw;
    map['PubRaw'] = pubRaw;
    return map;
  }

}