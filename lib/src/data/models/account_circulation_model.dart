class AccountCirculationModel {
  AccountCirculationModel({
      this.id, 
      this.itemNo, 
      this.fineAmnt, 
      this.paidAmnt, 
      this.paidDate,});

  AccountCirculationModel.fromJson(dynamic json) {
    id = json['ID'];
    itemNo = json['ItemNo'];
    fineAmnt = json['FineAmnt'];
    paidAmnt = json['PaidAmnt'];
    paidDate = json['PaidDate'];
  }
  String? id;
  String? itemNo;
  int? fineAmnt;
  int? paidAmnt;
  dynamic paidDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['ItemNo'] = itemNo;
    map['FineAmnt'] = fineAmnt;
    map['PaidAmnt'] = paidAmnt;
    map['PaidDate'] = paidDate;
    return map;
  }

}