import 'package:json_annotation/json_annotation.dart';

part 'photo_datum_links.g.dart';

@JsonSerializable()
class PhotoDatumLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  PhotoDatumLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });
  factory PhotoDatumLinks.fromJson(Map<String, dynamic> json) =>
      _$PhotoDatumLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDatumLinksToJson(this);
}
