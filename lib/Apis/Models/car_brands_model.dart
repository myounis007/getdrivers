class CarBrandsModel {
  int? status;
  List<Data>? data;

  CarBrandsModel({this.status, this.data});

  CarBrandsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? car;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.car, this.status, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    car = json['car'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car'] = car;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
