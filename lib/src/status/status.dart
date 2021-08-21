import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './AuthStatus.dart';
import './CfgBaseStatus.dart';
import './CfgSimpleNotificationStatus.dart';
import './CfgSimpleBannerStatus.dart';
import './UserAssetStatus.dart';


//所有组件的载入
//SingleChildWidget
Iterable<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthStatus()),
  ChangeNotifierProvider(create: (_) => CfgBaseStatus()),
  ChangeNotifierProvider(create: (_) => CfgSimpleNotificationStatus()),
  ChangeNotifierProvider(create: (_) => CfgSimpleBannerStatus()),
  ChangeNotifierProvider(create: (_) => UserAssetStatus()),
];
