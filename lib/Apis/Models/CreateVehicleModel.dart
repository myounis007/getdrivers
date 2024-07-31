class CreateVehicleModel {
  int? status;
  List<Data>? data;

  CreateVehicleModel({this.status, this.data});

  CreateVehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
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
  String? name;
  String? luggage;
  String? image;
  String? person;
  int? price;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.luggage,
      this.image,
      this.person,
      this.price,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    luggage = json['luggage'];
    image = json['image'];
    person = json['person'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['luggage'] = luggage;
    data['image'] = image;
    data['person'] = person;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
