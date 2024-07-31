class UserDetailModel {
  int? status;
  String? message;
  Data? data;

  UserDetailModel({this.status, this.message, this.data});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  String? name;
  String? email;
  String? phone;

  Data({this.name, this.email, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }

  @override
  String toString() {
    return 'Data(name: $name, email: $email, phone: $phone)';
  }
}
