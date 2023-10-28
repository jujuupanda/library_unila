class BookModels {
  BookModels({
      this.id, 
      this.title, 
      this.noCallBook,
      this.pusLib,
      this.edition, 
      this.serialNumber, 
      this.author, 
      this.data,});

  BookModels.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    noCallBook = json['noCallBook'];
    pusLib = json['pusLib'];
    edition = json['edition'];
    serialNumber = json['serialNumber'];
    author = json['author'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? noCallBook;
  String? pusLib;
  String? edition;
  String? serialNumber;
  String? author;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['noCallBook'] = noCallBook;
    map['pusLib'] = pusLib;
    map['edition'] = edition;
    map['serialNumber'] = serialNumber;
    map['author'] = author;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.noItem, 
      this.noCall, 
      this.status, 
      this.type, 
      this.location,});

  Data.fromJson(dynamic json) {
    noItem = json['noItem'];
    noCall = json['noCall'];
    status = json['status'];
    type = json['type'];
    location = json['location'];
  }
  String? noItem;
  String? noCall;
  String? status;
  String? type;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noItem'] = noItem;
    map['noCall'] = noCall;
    map['status'] = status;
    map['type'] = type;
    map['location'] = location;
    return map;
  }

}