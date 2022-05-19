// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);
import 'dart:convert';

class UserModel {
  UserModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      page: json["page"] ?? 0,
      perPage: json["per_page"] ?? 0,
      total: json["total"] ?? 0,
      totalPages: json["total_pages"] ?? 0,
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toMap()))
      };
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? null,
        email: json["email"] ?? null,
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        avatar: json["avatar"] ?? null,
    );

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        email: json["email"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        avatar: json["avatar"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
