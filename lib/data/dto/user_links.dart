import 'package:json_annotation/json_annotation.dart';

part 'user_links.g.dart';

@JsonSerializable()
class UserLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) =>
      _$UserLinksFromJson(json);

  Map<String, dynamic> toJson() => _$UserLinksToJson(this);
}
