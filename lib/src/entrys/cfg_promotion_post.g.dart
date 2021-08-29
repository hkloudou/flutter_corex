// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_promotion_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgPromotionPost _$CfgPromotionPostFromJson(Map json) {
  return CfgPromotionPost(
    json['blur'] as String? ?? '',
    json['url'] as String? ?? '',
    json['img'] as String? ?? '',
    json['bgColor'] as int? ?? 0,
  );
}

Map<String, dynamic> _$CfgPromotionPostToJson(CfgPromotionPost instance) =>
    <String, dynamic>{
      'blur': instance.blur,
      'url': instance.url,
      'img': instance.img,
      'bgColor': instance.bgColor,
    };
