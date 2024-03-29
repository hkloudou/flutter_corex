import 'package:corex/src/entrys/cfg_promotion_post.dart';
import 'package:json_annotation/json_annotation.dart';
import './cfg_server.dart';
import './cfg_update.dart';
import './cfg_block_chain.dart';
part 'cfg_base.g.dart';

@JsonSerializable()
class CfgBase {
  @JsonKey(defaultValue: [])
  final List<CfgServer> servers;

  @JsonKey(defaultValue: [])
  final List<CfgPromotionPost> promotions;

  @JsonKey()
  final CfgUpdate update;

  @JsonKey(defaultValue: [])
  final List<CfgBlockChain> chains;

  //promotionUrl

  CfgBase(
      {required this.servers,
      required this.promotions,
      required this.update,
      required this.chains});
  factory CfgBase.fromJson(Map<String, dynamic> json) =>
      _$CfgBaseFromJson(json);
  Map<String, dynamic> toJson() => _$CfgBaseToJson(this);
}
