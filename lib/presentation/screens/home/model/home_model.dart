
class HomeModel {
  final bool? success;
  final String? message;
  final Data? data;

  HomeModel({
    this.success,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
  final Meta? meta;
  final List<PlaceItem>? result;

  Data({
    this.meta,
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    result: json["result"] == null ? [] : List<PlaceItem>.from(json["result"]!.map((x) => PlaceItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Meta {
  final int? total;
  final int? page;
  final int? limit;
  final int? totalPages;

  Meta({
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
  };
}

class PlaceItem {
  final String? id;
  final String? name;
  final String? address;
  final Location? location;
  final PlaceType? placeType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PlaceItem({
    this.id,
    this.name,
    this.address,
    this.location,
    this.placeType,
    this.createdAt,
    this.updatedAt,
  });

  factory PlaceItem.fromJson(Map<String, dynamic> json) => PlaceItem(
    id: json["_id"],
    name: json["name"],
    address: json["address"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    placeType: json["placeType"] == null ? null : PlaceType.fromJson(json["placeType"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "address": address,
    "location": location?.toJson(),
    "placeType": placeType?.toJson(),
  };
}

class Location {
  final String? type;
  final List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class PlaceType {
  final String? id;
  final String? name;
  final String? categoryImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PlaceType({
    this.id,
    this.name,
    this.categoryImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PlaceType.fromJson(Map<String, dynamic> json) => PlaceType(
    id: json["_id"],
    name: json["name"],
    categoryImage: json["category_image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "category_image": categoryImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
