import 'package:json_annotation/json_annotation.dart';
import 'package:photos/data/model/user.dart';


part 'sponsorship.g.dart';
@JsonSerializable()

class Sponsorship {
  List<String>? impressionUrls;
  String? tagline;
  String? taglineUrl;
  User? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) =>
      _$SponsorshipFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorshipToJson(this);
}
