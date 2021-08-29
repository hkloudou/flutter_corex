library corex;

export 'src/deviceinfo.dart' show deviceID;
export 'src/packageinfo.dart' show packageInfo;
export 'src/config.dart' show EConfig, EColor;

//ext
export 'src/ext.dart' show DoubleFix, MyIterable;

//router
export 'src/router.dart' show showAnimatePage;

//launch
export 'src/WiseLaunchAdapter.dart' show WiseLaunchAdapter;

//ui
export 'src/ui.dart' show alert, showProgress, hideProgress;

//Status
export 'src/status/status.dart' show providers;
export 'src/status/AuthStatus.dart';
export 'src/status/UserAssetStatus.dart';
export 'src/status/CfgBaseStatus.dart';
export 'src/status/CfgSimpleBannerStatus.dart';
export 'src/status/CfgSimpleNotificationStatus.dart';

//Util
export 'src/DioAdapter.dart' show DioAdapter;
export 'src/MQTTAdapter.dart' show MQTTAdapter;
export 'src/HttpJsonPackage.dart' show HttpJsonPackage, addJsonHandle;

//entity
export 'src/entrys/asset_history.dart' show AssetHistory;

export 'src/entrys/cfg_promotion_post.dart' show CfgPromotionPost;

//init
export 'src/init.dart' show initCoreX;
