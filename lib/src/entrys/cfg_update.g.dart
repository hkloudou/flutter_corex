// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgUpdate _$CfgUpdateFromJson(Map json) {
  return CfgUpdate(
    json['minSupportAndroidVersion'] as String? ?? '',
    json['andoridHref'] as String? ?? '',
    json['minSupportIOSVersion'] as String? ?? '',
    json['iosHref'] as String? ?? '',
    json['minSupportWinVersion'] as String? ?? '',
    json['winHref'] as String? ?? '',
    json['minSupportMacVersion'] as String? ?? '',
    json['macHref'] as String? ?? '',
    json['stopNotice'] as String? ?? '',
    json['alertNoice'] as String? ?? '',
  );
}

Map<String, dynamic> _$CfgUpdateToJson(CfgUpdate instance) => <String, dynamic>{
      'minSupportAndroidVersion': instance.minSupportAndroidVersion,
      'andoridHref': instance.andoridHref,
      'minSupportIOSVersion': instance.minSupportIOSVersion,
      'iosHref': instance.iosHref,
      'minSupportWinVersion': instance.minSupportWinVersion,
      'winHref': instance.winHref,
      'minSupportMacVersion': instance.minSupportMacVersion,
      'macHref': instance.macHref,
      'stopNotice': instance.stopNotice,
      'alertNoice': instance.alertNoice,
    };
