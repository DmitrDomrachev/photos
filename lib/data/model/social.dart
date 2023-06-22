import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@JsonSerializable()
class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) =>
      _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
