class BorrowModels {
  BorrowModels({
      this.npm,
      this.title,
      this.noItem,
      this.noCall, 
      this.author, 
      this.edition, 
      this.serialNumber, 
      this.dateBorrow, 
      this.dateReturn,});

  BorrowModels.fromJson(dynamic json) {
    npm = json['npm'];
    title = json['title'];
    noItem = json['noItem'];
    noCall = json['noCall'];
    author = json['author'];
    edition = json['edition'];
    serialNumber = json['serialNumber'];
    dateBorrow = json['dateBorrow'];
    dateReturn = json['dateReturn'];
  }
  String? npm;
  String? title;
  String? noItem;
  String? noCall;
  String? author;
  String? edition;
  String? serialNumber;
  String? dateBorrow;
  String? dateReturn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['npm'] = npm;
    map['title'] = title;
    map['noItem'] = noItem;
    map['noCall'] = noCall;
    map['author'] = author;
    map['edition'] = edition;
    map['serialNumber'] = serialNumber;
    map['dateBorrow'] = dateBorrow;
    map['dateReturn'] = dateReturn;
    return map;
  }

}