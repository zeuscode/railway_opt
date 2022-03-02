import 'package:flutter/widgets.dart';
import 'package:railway_opt/accout_manager_page.dart';
import 'package:railway_opt/off_line_calibration_page.dart';
import 'package:railway_opt/router/router_link.dart';
import 'package:railway_opt/utils/json_config.dart';
import '../about_page.dart';
import '../line_calibration_page.dart';
import '../mantar_detail_page.dart';
import '../mantar_input_page.dart';
import '../security_settings_page.dart';
import '../time_calibration_page.dart';

class Routers {
  final String appScheme = "railwayOpt";

  Map<String, Widget Function(BuildContext context)> registerRouter() {
    return {
      RouterLink.MANTAR_LIST_PAGE: (context) =>
          _buildPage(const ManTarInputPage()),
      RouterLink.SECURITY_SETTINGS_PAGE: (context) =>
          _buildPage(SecuritySettingsPage()),
      RouterLink.TIME_CALIBRATION_PAGE: (context) =>
          _buildPage(const TimeCalibrationPage()),
      RouterLink.OFF_LINE_CALIBRATION_PAGE: (context) =>
          _buildPage(const OffLineCalibrationPage()),
      RouterLink.LINE_CALIBRATION_PAGE: (context) =>
          _buildPage(const LineCalibrationPage()),
      RouterLink.ABOUT_PAGE:(context)=>_buildPage(const AboutPage()),
      // ignore: equal_keys_in_map
      RouterLink.ACCOUNT_MANAGER:(context)=>_buildPage(const AccoutManagertPage()),
      RouterLink.MANTAR_DETAIL_PAGE:(context){
       return _buildPage(const MantarDetailPage());

      }
    };
  }

  _buildPage(Widget page) {
    return page;
  }

  void push(BuildContext context, String target, {Map? value}) {
    pushLink(context, enCodeUrl(target, value));
  }

  void pushLink(BuildContext context, String url) {
    Map<String, dynamic> urlParseRet = _parseUrl(url);
    Navigator.pushNamedAndRemoveUntil(context, urlParseRet['action'].toString(),
        (route) {
      if (route.settings.name == urlParseRet['action'].toString()) {
        return false;
      }
      return true;
    }, arguments: urlParseRet['params']);
  }

  String enCodeUrl(String target, Object? value) {
    if (value == null) {
      return target;
    }
    return "${target}?${JsonConfig.toJSonString(value)}";
  }

  /// 解析跳转的url，并且分析其内部参数
  Map<String, dynamic> _parseUrl(String url) {
    if (url.startsWith(appScheme)) {
      url = url.substring(9);
    }
    int placeIndex = url.indexOf('?');
    if (url == '' || url == null) {
      return {'action': '/', 'params': null};
    }
    if (placeIndex < 0) {
      return {'action': url, 'params': null};
    }
    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex + 1);
    if (paramStr == null) {
      return {'action': action, 'params': null};
    }
    Map params = {};
    List<String> paramsStrArr = paramStr.split('&');
    if(paramsStrArr.length == 1){
      return {'action': action, 'params': paramsStrArr[0]};
    }
    for (String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      params[singleParamsArr[0]] = singleParamsArr[1];
    }
    return {'action': action, 'params': params};
  }
}
