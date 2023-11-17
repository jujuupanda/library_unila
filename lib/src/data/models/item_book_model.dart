class ItemBookModel {
  ItemBookModel({
      this.itemBib, 
      this.itemNo, 
      this.itemClss, 
      this.locaCode, 
      this.copyNo, 
      this.itemStat,});

  ItemBookModel.fromJson(dynamic json) {
    itemBib = json['ItemBib'];
    itemNo = json['ItemNo'];
    itemClss = json['ItemClss'];
    locaCode = json['LocaCode'];
    copyNo = json['CopyNo'];
    itemStat = json['ItemStat'];
  }
  int? itemBib;
  String? itemNo;
  String? itemClss;
  String? locaCode;
  int? copyNo;
  String? itemStat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ItemBib'] = itemBib;
    map['ItemNo'] = itemNo;
    map['ItemClss'] = itemClss;
    map['LocaCode'] = locaCode;
    map['CopyNo'] = copyNo;
    map['ItemStat'] = itemStat;
    return map;
  }

}