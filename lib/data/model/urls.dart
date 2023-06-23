import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable()
class Urls {
  String? raw;
  String full;
  String? regular;
  String small;
  String? thumb;
  String? smallS3;

  Urls({
    required this.full,
    required this.small,
    this.raw,
    this.regular,
    this.thumb,
    this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
