
class ProfileModel {
  final bool? success;
  final String? message;
  final Data? data;

  ProfileModel({
    this.success,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? user;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Data({
    this.id,
    this.user,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    user: json["user"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    profileImage: json["profile_image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "profile_image": profileImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
