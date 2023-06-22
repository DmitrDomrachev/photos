import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable()
class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({
    required this.full,
    required this.raw,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
