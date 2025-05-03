
class NotificationModel {
  final bool? success;
  final String? message;
  final Data? data;

  NotificationModel({
    this.success,
    this.message,
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
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
  final List<Result>? result;

  Data({
    this.meta,
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}

class Result {
  final String? id;
  final String? title;
  final String? message;
  final String? receiver;
  final List<String>? deleteBy;
  final List<dynamic>? seenBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Result({
    this.id,
    this.title,
    this.message,
    this.receiver,
    this.deleteBy,
    this.seenBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    title: json["title"],
    message: json["message"],
    receiver: json["receiver"],
    deleteBy: json["deleteBy"] == null ? [] : List<String>.from(json["deleteBy"]!.map((x) => x)),
    seenBy: json["seenBy"] == null ? [] : List<dynamic>.from(json["seenBy"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "message": message,
    "receiver": receiver,
    "deleteBy": deleteBy == null ? [] : List<dynamic>.from(deleteBy!.map((x) => x)),
    "seenBy": seenBy == null ? [] : List<dynamic>.from(seenBy!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
