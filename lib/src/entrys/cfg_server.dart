import 'package:json_annotation/json_annotation.dart';

part 'cfg_server.g.dart';

List<CfgServer> getCfgServerList(List<dynamic> list) {
  List<CfgServer> result = [];
  list.forEach((item) {
    result.add(CfgServer.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class CfgServer {
  @JsonKey(defaultValue: "")
  final String group;

  @JsonKey(defaultValue: "")
  final String name;

  @JsonKey(defaultValue: "")
  final String host;

  @JsonKey(defaultValue: 10000)
  final int connectTimeout;

  @JsonKey(defaultValue: 3000)
  final int sendTimeout;

  @JsonKey(defaultValue: 3000)
  final int receiveTimeout;

  @JsonKey(defaultValue: false)
  final bool unsafe;

  @JsonKey(defaultValue: 0)
  final int power;

  CfgServer(
      {required this.group,
      required this.name,
      required this.host,
      required this.connectTimeout,
      required this.sendTimeout,
      required this.receiveTimeout,
      required this.unsafe,
      required this.power});
  factory CfgServer.fromJson(Map<String, dynamic> json) =>
      _$CfgServerFromJson(json);
  Map<String, dynamic> toJson() => _$CfgServerToJson(this);
}
