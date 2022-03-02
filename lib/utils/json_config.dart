import 'dart:convert';

class JsonConfig {
  JsonConfig._();

  static Map objectToMap(String source) {
    return jsonDecode(source);
  }


  static String toJSonString(Object? object) {
    return jsonEncode(object);
  }
}
