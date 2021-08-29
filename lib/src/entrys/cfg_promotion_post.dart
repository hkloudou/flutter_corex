import 'package:json_annotation/json_annotation.dart';

part 'cfg_promotion_post.g.dart';

@JsonSerializable()
class CfgPromotionPost extends Object {
  @JsonKey(name: 'blur', defaultValue: "")
  String blur;

  @JsonKey(name: 'url', defaultValue: "")
  String url;

  @JsonKey(name: 'img', defaultValue: "")
  String img;

  @JsonKey(name: 'bgColor', defaultValue: 0)
  int bgColor;

  CfgPromotionPost(
    this.blur,
    this.url,
    this.img,
    this.bgColor,
  );

  factory CfgPromotionPost.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgPromotionPostFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgPromotionPostToJson(this);
}
