import 'package:json_annotation/json_annotation.dart';

part 'user_asset.g.dart';

double _fromJsonDecimalTodouble(String? str) =>
    double.tryParse(str ?? "-") ?? 0;

List<UserAsset> getUserAssetList(List<dynamic> list) {
  List<UserAsset> result = [];
  list.forEach((item) {
    result.add(UserAsset.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class UserAsset extends Object {
  @JsonKey(defaultValue: "")
  String asset;

  @JsonKey(defaultValue: 0)
  int group;

  @JsonKey(fromJson: _fromJsonDecimalTodouble)
  double free;

  @JsonKey(fromJson: _fromJsonDecimalTodouble)
  double locked;

  UserAsset(
    this.asset,
    this.group,
    this.free,
    this.locked,
  );

  factory UserAsset.fromJson(Map<String, dynamic> srcJson) =>
      _$UserAssetFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserAssetToJson(this);
}
