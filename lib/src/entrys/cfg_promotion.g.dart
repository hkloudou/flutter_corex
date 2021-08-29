// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgPromotion _$CfgPromotionFromJson(Map json) {
  return CfgPromotion(
    json['url'] as String? ?? '',
    (json['posts'] as List<dynamic>?)
            ?.map((e) =>
                PromotionPost.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CfgPromotionToJson(CfgPromotion instance) =>
    <String, dynamic>{
      'url': instance.url,
      'posts': instance.posts,
    };

PromotionPost _$PromotionPostFromJson(Map json) {
  return PromotionPost(
    json['blur'] as String? ?? '',
    json['img'] as String? ?? '',
    json['bgColor'] as int? ?? 0,
  );
}

Map<String, dynamic> _$PromotionPostToJson(PromotionPost instance) =>
    <String, dynamic>{
      'blur': instance.blur,
      'img': instance.img,
      'bgColor': instance.bgColor,
    };
