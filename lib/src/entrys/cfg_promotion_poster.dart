import 'package:json_annotation/json_annotation.dart';

part 'cfg_promotion_poster.g.dart';

List<CfgPromotionPoster> getCfgPromotionPosterList(List<dynamic> list) {
  List<CfgPromotionPoster> result = [];
  list.forEach((item) {
    result.add(CfgPromotionPoster.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class CfgPromotionPoster extends Object {
  @JsonKey(name: 'blur')
  String blur;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'bgColor')
  int bgColor;

  CfgPromotionPoster(
    this.blur,
    this.img,
    this.bgColor,
  );

  factory CfgPromotionPoster.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgPromotionPosterFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgPromotionPosterToJson(this);
}
