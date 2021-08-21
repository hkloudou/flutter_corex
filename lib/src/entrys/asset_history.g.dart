// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetHistory _$AssetHistoryFromJson(Map json) {
  return AssetHistory(
    iD: json['iD'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    amount: json['amount'] as String? ?? '',
    reson: json['reson'] as String? ?? '',
    step: json['step'] as int? ?? 0,
    createdAt: json['createdAt'] as int? ?? 0,
    meta: (json['meta'] as Map?)?.map(
          (k, e) => MapEntry(k as String, e),
        ) ??
        {},
  );
}

Map<String, dynamic> _$AssetHistoryToJson(AssetHistory instance) =>
    <String, dynamic>{
      'iD': instance.iD,
      'name': instance.name,
      'reson': instance.reson,
      'amount': instance.amount,
      'step': instance.step,
      'createdAt': instance.createdAt,
      'meta': instance.meta,
    };
