import 'package:json_annotation/json_annotation.dart';

part 'arts_culture.g.dart';

@JsonSerializable()
class ArtsCulture {
  String? status;
  DateTime? approvedOn;

  ArtsCulture({
    this.status,
    this.approvedOn,
  });

  factory ArtsCulture.fromJson(Map<String, dynamic> json) =>
      _$ArtsCultureFromJson(json);

  Map<String, dynamic> toJson() => _$ArtsCultureToJson(this);
}