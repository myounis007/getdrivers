class CarModel {
  int? status;
  List<CarData>? data;

  CarModel({this.status, this.data});

  CarModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CarData>[];
      json['data'].forEach((v) {
        data!.add(CarData.fromJson(v));
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

class CarData {
  int? id;
  String? car;
  String? status;
  String? createdAt;
  String? updatedAt;

  CarData({this.id, this.car, this.status, this.createdAt, this.updatedAt});

  CarData.fromJson(Map<String, dynamic> json) {
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
