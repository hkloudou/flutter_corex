import 'package:package_info/package_info.dart';

// PackageInfo
PackageInfo? _packageInfo;

Future<void> initPackageInfo() async {
  print("corex:initPackageInfo");
  return PackageInfo.fromPlatform().then((value) => _packageInfo = value);
}

PackageInfo get packageInfo {
  return _packageInfo!;
}
