import 'package:json_annotation/json_annotation.dart';

part 'cfg_block_chain.g.dart';

List<CfgBlockChain> getCfgBlockChainList(List<dynamic> list) {
  List<CfgBlockChain> result = [];
  list.forEach((item) {
    result.add(CfgBlockChain.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class CfgBlockChain extends Object {
  static dynamic _fromJsonDecimalTodouble(String? str) =>
      double.tryParse(str ?? "-");
  @JsonKey(name: 'addressRegex', defaultValue: "")
  String addressRegex;

  @JsonKey(name: 'asset', defaultValue: "")
  String asset;

  @JsonKey(name: 'depositEnable', defaultValue: false)
  bool depositEnable;

  @JsonKey(name: 'isDefault', defaultValue: false)
  bool isDefault;

  @JsonKey(name: 'minConfirm', defaultValue: 30)
  int minConfirm;

  @JsonKey(name: 'name', defaultValue: "")
  String name;

  @JsonKey(name: 'chain', defaultValue: "")
  String chain;

  @JsonKey(name: 'unLockConfirm', defaultValue: 0)
  int unLockConfirm;

  @JsonKey(name: 'withdrawEnable', defaultValue: true)
  bool withdrawEnable;

  @JsonKey(
      name: 'withdrawFee', fromJson: _fromJsonDecimalTodouble, defaultValue: 1)
  double withdrawFee;

  @JsonKey(
      name: 'withdrawMin', fromJson: _fromJsonDecimalTodouble, defaultValue: 1)
  double withdrawMin;

  CfgBlockChain(
    this.addressRegex,
    this.asset,
    this.depositEnable,
    this.isDefault,
    this.minConfirm,
    this.name,
    this.chain,
    this.unLockConfirm,
    this.withdrawEnable,
    this.withdrawFee,
    this.withdrawMin,
  );

  factory CfgBlockChain.fromJson(Map<String, dynamic> srcJson) =>
      _$CfgBlockChainFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CfgBlockChainToJson(this);
}
