import 'package:json_annotation/json_annotation.dart';
part 'basic_api_res.g.dart';

@JsonSerializable()
class BasicResponse {
  String? status;
  String? message;

  BasicResponse({this.status, this.message});

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}
