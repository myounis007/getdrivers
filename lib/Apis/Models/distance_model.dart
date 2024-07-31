class DistanceModel {
  int? status;
  List<Data>? data;

  DistanceModel({this.status, this.data});

  DistanceModel.fromJson(Map<String, dynamic> json) {
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
  String? distance;
  String? price;
  String? currency;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.distance,
      this.price,
      this.currency,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    distance = json['distance'];
    price = json['price'];
    currency = json['currency'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['distance'] = distance;
    data['price'] = price;
    data['currency'] = currency;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
