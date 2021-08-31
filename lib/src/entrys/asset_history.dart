import 'package:json_annotation/json_annotation.dart';

part 'asset_history.g.dart';

List<AssetHistory> getAssetHistoryList(List<dynamic> list) {
  List<AssetHistory> result = [];
  list.forEach((item) {
    result.add(AssetHistory.fromJson(item));
  });
  return result;
}

/*
AssetHistory 资产名字
 */
@JsonSerializable()
class AssetHistory {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: "")
  final String asset;

  @JsonKey(defaultValue: 0)
  final int group;

  @JsonKey(defaultValue: "")
  final String reson;

  @JsonKey(defaultValue: "")
  final String amount;

  @JsonKey(defaultValue: 0)
  final int step;

  @JsonKey(defaultValue: 0)
  final int createdAt;

  @JsonKey(defaultValue: {})
  final Map<String, dynamic> meta;
  AssetHistory({
    required this.id,
    required this.asset,
    required this.group,
    required this.amount,
    required this.reson,
    required this.step,
    required this.createdAt,
    required this.meta,
  });
  factory AssetHistory.fromJson(Map<String, dynamic> json) =>
      _$AssetHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$AssetHistoryToJson(this);
}
