import 'package:json_annotation/json_annotation.dart';

part 'cfg_simple_banner.g.dart';

@JsonSerializable()
class CfgSimpleBanner extends Object {
  @JsonKey(defaultValue: false)
  bool enable;

  @JsonKey(defaultValue: 1800)
  int width;

  @JsonKey(defaultValue: 900)
  int height;

  @JsonKey(defaultValue: [])
  List<CfgSimpleBannerItem> items;

  CfgSimpleBanner(
    this.enable,
    this.width,
    this.height,
    this.items,
  );

  factory CfgSimpleBanner.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgSimpleBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgSimpleBannerToJson(this);
}

@JsonSerializable()
class CfgSimpleBannerItem extends Object {
  @JsonKey(defaultValue: "")
  String img;

  @JsonKey(defaultValue: "")
  String blur;

  @JsonKey(defaultValue: "")
  String href;

  CfgSimpleBannerItem(
    this.img,
    this.blur,
    this.href,
  );

  factory CfgSimpleBannerItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgSimpleBannerItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgSimpleBannerItemToJson(this);
}
