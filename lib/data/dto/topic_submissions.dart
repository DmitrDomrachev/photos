import 'package:json_annotation/json_annotation.dart';
import 'package:photos/data/dto/arts_culture.dart';


part 'topic_submissions.g.dart';
@JsonSerializable()

class TopicSubmissions {
  ArtsCulture? experimental;
  ArtsCulture? artsCulture;

  TopicSubmissions({
    this.experimental,
    this.artsCulture,
  });
  factory TopicSubmissions.fromJson(Map<String, dynamic> json) =>
      _$TopicSubmissionsFromJson(json);

  Map<String, dynamic> toJson() => _$TopicSubmissionsToJson(this);
}
