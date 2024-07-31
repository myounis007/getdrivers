class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? phone;
  String? referalCode;
  String? carrierShortName;
  String? ownershipType;
  String? language;
  String? type;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.referalCode,
      this.carrierShortName,
      this.ownershipType,
      this.language,
      this.type,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    referalCode = json['referal_code'];
    carrierShortName = json['carrier_short_name'];
    ownershipType = json['ownership_type'];
    language = json['language'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['referal_code'] = referalCode;
    data['carrier_short_name'] = carrierShortName;
    data['ownership_type'] = ownershipType;
    data['language'] = language;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
