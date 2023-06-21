import 'package:json_annotation/json_annotation.dart';

import 'photo_datum_links.dart';
import 'sponsorship.dart';
import 'topic_submissions.dart';
import 'urls.dart';
import 'user.dart';

part 'photo_data.g.dart';

@JsonSerializable()
class PhotoData {
  String id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls urls;
  PhotoDatumLinks? links;
  int likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  Sponsorship? sponsorship;
  TopicSubmissions? topicSubmissions;
  User user;

  PhotoData({
    required this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    required this.urls,
    this.links,
    required this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    required this.user,
  });

  factory PhotoData.fromJson(Map<String, dynamic> json) =>
      _$PhotoDataFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDataToJson(this);
}
