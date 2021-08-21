// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_simple_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgSimpleNotification _$CfgSimpleNotificationFromJson(Map json) {
  return CfgSimpleNotification(
    json['enable'] as bool? ?? false,
    (json['items'] as List<dynamic>?)
            ?.map((e) => CfgSimpleNotificationItem.fromJson(
                Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CfgSimpleNotificationToJson(
        CfgSimpleNotification instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'items': instance.items,
    };

CfgSimpleNotificationItem _$CfgSimpleNotificationItemFromJson(Map json) {
  return CfgSimpleNotificationItem(
    json['updatedAt'] as int? ?? 0,
    json['title'] as String? ?? '',
    json['href'] as String? ?? '',
  );
}

Map<String, dynamic> _$CfgSimpleNotificationItemToJson(
        CfgSimpleNotificationItem instance) =>
    <String, dynamic>{
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'href': instance.href,
    };
