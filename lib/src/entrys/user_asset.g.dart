// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAsset _$UserAssetFromJson(Map json) {
  return UserAsset(
    json['asset'] as String? ?? '',
    _fromJsonDecimalTodouble(json['free'] as String?),
    _fromJsonDecimalTodouble(json['locked'] as String?),
  );
}

Map<String, dynamic> _$UserAssetToJson(UserAsset instance) => <String, dynamic>{
      'asset': instance.asset,
      'free': instance.free,
      'locked': instance.locked,
    };
