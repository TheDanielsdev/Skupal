import 'package:json_annotation/json_annotation.dart';
part 'profile_completeness.g.dart';

@JsonSerializable()
class ProfileCompletion {
  String? status;
  double? data;

  ProfileCompletion({
    this.status,
    this.data,
  });

  factory ProfileCompletion.fromJson(Map<String, dynamic> json) =>
      _$ProfileCompletionFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileCompletionToJson(this);
}
