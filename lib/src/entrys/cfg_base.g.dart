// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfg_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfgBase _$CfgBaseFromJson(Map json) {
  return CfgBase(
    servers: (json['servers'] as List<dynamic>?)
            ?.map(
                (e) => CfgServer.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
    promotion: (json['promotion'] as List<dynamic>?)
            ?.map((e) =>
                CfgPromotion.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
    update:
        CfgUpdate.fromJson(Map<String, dynamic>.from(json['update'] as Map)),
    chains: (json['chains'] as List<dynamic>?)
            ?.map((e) =>
                CfgBlockChain.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CfgBaseToJson(CfgBase instance) => <String, dynamic>{
      'servers': instance.servers,
      'promotion': instance.promotion,
      'update': instance.update,
      'chains': instance.chains,
    };
