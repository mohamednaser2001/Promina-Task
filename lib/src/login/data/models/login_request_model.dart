
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_model.g.dart';
@JsonSerializable()
class LoginRequestModel{
  String email;
  String password;
  LoginRequestModel({required this.email, required this.password});

  // Convert LoginRequestModel to a Map
  Map<String, dynamic> toJson()=> _$LoginRequestModelToJson(this);
}