import 'package:json_annotation/json_annotation.dart';
import 'package:photos/data/model/photo_datum_links.dart';
import 'package:photos/data/model/sponsorship.dart';
import 'package:photos/data/model/topic_submissions.dart';
import 'package:photos/data/model/urls.dart';
import 'package:photos/data/model/user.dart';


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
    required this.urls, required this.likes, required this.user, this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.links,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
  });

  factory PhotoData.fromJson(Map<String, dynamic> json) =>
      _$PhotoDataFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDataToJson(this);
}
