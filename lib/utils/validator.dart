class Validator {
  static const String PATTERN_MOBILE_NO = '^[56789][0-9]{9}\$';
  static const String PATTERN_EMAIL_ID =
      '^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})\$';

  static bool _isValid(dynamic value, String pattern) {
    return value != null && new RegExp(pattern).hasMatch(value);
  }

  static bool isNullOrEmpty(String str) {
    return str == null || str == '';
  }
  
  static bool isValidEmailId(String emailId) {
    return Validator._isValid(emailId, PATTERN_EMAIL_ID);
  }

}
