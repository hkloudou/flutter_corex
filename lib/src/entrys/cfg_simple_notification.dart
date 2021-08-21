import 'package:json_annotation/json_annotation.dart';

part 'cfg_simple_notification.g.dart';

@JsonSerializable()
class CfgSimpleNotification extends Object {
  @JsonKey(defaultValue: false)
  bool enable;

  @JsonKey(defaultValue: [])
  List<CfgSimpleNotificationItem> items;

  CfgSimpleNotification(
    this.enable,
    this.items,
  );

  factory CfgSimpleNotification.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgSimpleNotificationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgSimpleNotificationToJson(this);
}

@JsonSerializable()
class CfgSimpleNotificationItem extends Object {
  @JsonKey(defaultValue: 0)
  int updatedAt;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String href;

  CfgSimpleNotificationItem(
    this.updatedAt,
    this.title,
    this.href,
  );

  factory CfgSimpleNotificationItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgSimpleNotificationItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgSimpleNotificationItemToJson(this);
}
