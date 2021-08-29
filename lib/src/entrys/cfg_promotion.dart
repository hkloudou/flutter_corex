import 'package:json_annotation/json_annotation.dart';

part 'cfg_promotion.g.dart';

@JsonSerializable()
class CfgPromotion extends Object {
  @JsonKey(name: 'url', defaultValue: "")
  String url;

  @JsonKey(name: 'posts', defaultValue: [])
  List<PromotionPost> posts;

  CfgPromotion(
    this.url,
    this.posts,
  );

  factory CfgPromotion.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgPromotionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgPromotionToJson(this);
}

@JsonSerializable()
class PromotionPost extends Object {
  @JsonKey(name: 'blur', defaultValue: "")
  String blur;

  @JsonKey(name: 'img', defaultValue: "")
  String img;

  @JsonKey(name: 'bgColor', defaultValue: 0)
  int bgColor;

  PromotionPost(
    this.blur,
    this.img,
    this.bgColor,
  );

  factory PromotionPost.fromJson(Map<String, dynamic> srcJson) =>
      _$PromotionPostFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PromotionPostToJson(this);
}
