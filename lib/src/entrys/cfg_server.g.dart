// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgServer _$CfgServerFromJson(Map json) {
  return CfgServer(
    group: json['group'] as String? ?? '',
    name: json['name'] as String? ?? '',
    host: json['host'] as String? ?? '',
    connectTimeout: json['connectTimeout'] as int? ?? 10000,
    sendTimeout: json['sendTimeout'] as int? ?? 3000,
    receiveTimeout: json['receiveTimeout'] as int? ?? 3000,
    unsafe: json['unsafe'] as bool? ?? false,
    power: json['power'] as int? ?? 0,
  );
}

Map<String, dynamic> _$CfgServerToJson(CfgServer instance) => <String, dynamic>{
      'group': instance.group,
      'name': instance.name,
      'host': instance.host,
      'connectTimeout': instance.connectTimeout,
      'sendTimeout': instance.sendTimeout,
      'receiveTimeout': instance.receiveTimeout,
      'unsafe': instance.unsafe,
      'power': instance.power,
    };
