class MantraUtil {
  static bool verify(String? content) {
    if(content==null) return false;
    if (content.isNotEmpty && content.length > 15 && isNumber(content)) {
      return true;
    }
    return false;
  }

  static bool isNumber(String str) {
    final reg = RegExp(r'^-?[0-9]+');
    return reg.hasMatch(str);
  }
}
