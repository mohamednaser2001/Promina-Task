


import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserDataModel {
  String token;
  @JsonKey(name: 'user')
  User user;

  UserDataModel({
    required this.token,
    required this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String email;
  String name;
  @JsonKey(name: 'email_verified_at')
  String emailVerifiedAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.emailVerifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}