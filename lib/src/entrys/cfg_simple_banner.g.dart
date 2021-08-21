// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_simple_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgSimpleBanner _$CfgSimpleBannerFromJson(Map json) {
  return CfgSimpleBanner(
    json['enable'] as bool? ?? false,
    json['width'] as int? ?? 1800,
    json['height'] as int? ?? 900,
    (json['items'] as List<dynamic>?)
            ?.map((e) => CfgSimpleBannerItem.fromJson(
                Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CfgSimpleBannerToJson(CfgSimpleBanner instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'width': instance.width,
      'height': instance.height,
      'items': instance.items,
    };

CfgSimpleBannerItem _$CfgSimpleBannerItemFromJson(Map json) {
  return CfgSimpleBannerItem(
    json['img'] as String? ?? '',
    json['blur'] as String? ?? '',
    json['href'] as String? ?? '',
  );
}

Map<String, dynamic> _$CfgSimpleBannerItemToJson(
        CfgSimpleBannerItem instance) =>
    <String, dynamic>{
      'img': instance.img,
      'blur': instance.blur,
      'href': instance.href,
    };
