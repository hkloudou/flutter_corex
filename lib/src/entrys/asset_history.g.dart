// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetHistory _$AssetHistoryFromJson(Map json) {
  return AssetHistory(
    iD: json['iD'] as int? ?? 0,
    asset: json['asset'] as String? ?? '',
    group: json['group'] as int? ?? 0,
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
      'asset': instance.asset,
      'group': instance.group,
      'reson': instance.reson,
      'amount': instance.amount,
      'step': instance.step,
      'createdAt': instance.createdAt,
      'meta': instance.meta,
    };
