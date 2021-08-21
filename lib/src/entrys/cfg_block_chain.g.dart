// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_block_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgBlockChain _$CfgBlockChainFromJson(Map json) {
  return CfgBlockChain(
    json['addressRegex'] as String? ?? '',
    json['asset'] as String? ?? '',
    json['depositEnable'] as bool? ?? false,
    json['isDefault'] as bool? ?? false,
    json['minConfirm'] as int? ?? 30,
    json['name'] as String? ?? '',
    json['chain'] as String? ?? '',
    json['unLockConfirm'] as int? ?? 0,
    json['withdrawEnable'] as bool? ?? true,
    CfgBlockChain._fromJsonDecimalTodouble(json['withdrawFee'] as String?) ?? 1,
    CfgBlockChain._fromJsonDecimalTodouble(json['withdrawMin'] as String?) ?? 1,
  );
}

Map<String, dynamic> _$CfgBlockChainToJson(CfgBlockChain instance) =>
    <String, dynamic>{
      'addressRegex': instance.addressRegex,
      'asset': instance.asset,
      'depositEnable': instance.depositEnable,
      'isDefault': instance.isDefault,
      'minConfirm': instance.minConfirm,
      'name': instance.name,
      'chain': instance.chain,
      'unLockConfirm': instance.unLockConfirm,
      'withdrawEnable': instance.withdrawEnable,
      'withdrawFee': instance.withdrawFee,
      'withdrawMin': instance.withdrawMin,
    };
