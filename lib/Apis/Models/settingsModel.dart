class SettingsModel {
  int status;
  Data data;

  SettingsModel({required this.status, required this.data});

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : Data.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }

  factory SettingsModel.empty() {
    return SettingsModel(
      status: 0,
      data: Data.empty(),
    );
  }
}

class Data {
  List<ManufactureYear> manufactureYears;
  List<CarModel> carModels;
  List<CarBrand> carBrands;
  List<CarColor> colors;

  Data({
    required this.manufactureYears,
    required this.carModels,
    required this.carBrands,
    required this.colors,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      manufactureYears: (json['manufacture_years'] as List)
          .map((e) => ManufactureYear.fromJson(e))
          .toList(),
      carModels: (json['car_models'] as List)
          .map((e) => CarModel.fromJson(e))
          .toList(),
      carBrands: (json['car_brands'] as List)
          .map((e) => CarBrand.fromJson(e))
          .toList(),
      colors:
          (json['colors'] as List).map((e) => CarColor.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manufacture_years': manufactureYears.map((e) => e.toJson()).toList(),
      'car_models': carModels.map((e) => e.toJson()).toList(),
      'car_brands': carBrands.map((e) => e.toJson()).toList(),
      'colors': colors.map((e) => e.toJson()).toList(),
    };
  }

  factory Data.empty() {
    return Data(
      manufactureYears: [],
      carModels: [],
      carBrands: [],
      colors: [],
    );
  }
}

class ManufactureYear {
  int id;
  String year;
  String createdAt;
  String updatedAt;

  ManufactureYear({
    required this.id,
    required this.year,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManufactureYear.fromJson(Map<String, dynamic> json) {
    return ManufactureYear(
      id: json['id'],
      year: json['year'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'year': year,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory ManufactureYear.empty() {
    return ManufactureYear(
      id: 0,
      year: '',
      createdAt: '',
      updatedAt: '',
    );
  }
}

class CarModel {
  int id;
  String car;
  String status;
  String createdAt;
  String updatedAt;

  CarModel({
    required this.id,
    required this.car,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      car: json['car'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'car': car,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory CarModel.empty() {
    return CarModel(
      id: 0,
      car: '',
      status: '',
      createdAt: '',
      updatedAt: '',
    );
  }
}

class CarBrand {
  int id;
  String car;
  String createdAt;
  String updatedAt;

  CarBrand({
    required this.id,
    required this.car,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      id: json['id'],
      car: json['car'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'car': car,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory CarBrand.empty() {
    return CarBrand(
      id: 0,
      car: '',
      createdAt: '',
      updatedAt: '',
    );
  }
}

class CarColor {
  int id;
  String color;
  String colorCode;
  String createdAt;
  String updatedAt;

  CarColor({
    required this.id,
    required this.color,
    required this.colorCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarColor.fromJson(Map<String, dynamic> json) {
    return CarColor(
      id: json['id'],
      color: json['color'],
      colorCode: json['color_code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'color_code': colorCode,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory CarColor.empty() {
    return CarColor(
      id: 0,
      color: '',
      colorCode: '',
      createdAt: '',
      updatedAt: '',
    );
  }
}
