/*
class OtherModel {
  final bool? success;
  final String? message;
  final Data? data;

  OtherModel({
    this.success,
    this.message,
    this.data,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );
}
*/
