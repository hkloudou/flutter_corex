import 'package:json_annotation/json_annotation.dart';

part 'cfg_update.g.dart';

@JsonSerializable()
class CfgUpdate extends Object {
  @JsonKey(defaultValue: "")
  String minSupportAndroidVersion;

  @JsonKey(defaultValue: "")
  String andoridHref;

  @JsonKey(defaultValue: "")
  String minSupportIOSVersion;

  @JsonKey(defaultValue: "")
  String iosHref;

  @JsonKey(defaultValue: "")
  String minSupportWinVersion;

  @JsonKey(defaultValue: "")
  String winHref;

  @JsonKey(defaultValue: "")
  String minSupportMacVersion;

  @JsonKey(defaultValue: "")
  String macHref;

  @JsonKey(defaultValue: "")
  String stopNotice;

  @JsonKey(defaultValue: "")
  String alertNoice;

  CfgUpdate(
    this.minSupportAndroidVersion,
    this.andoridHref,
    this.minSupportIOSVersion,
    this.iosHref,
    this.minSupportWinVersion,
    this.winHref,
    this.minSupportMacVersion,
    this.macHref,
    this.stopNotice,
    this.alertNoice,
  );

  factory CfgUpdate.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgUpdateFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgUpdateToJson(this);
}
