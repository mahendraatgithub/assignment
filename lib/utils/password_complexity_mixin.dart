mixin PasswordComplexityChecker {
  Map<String, bool> testStatus = {
    'lowercase': false,
    'uppercase': false,
    'number': false,
    'characters': false,
  };

  updateStatus(String value) {
    if (value == null) {
      return;
    }
    testStatus['lowercase'] = hasLowercase(value);
    testStatus['uppercase'] = hasUppercase(value);
    testStatus['number'] = hasNumber(value);
    testStatus['characters'] = hasSpecialCharacter(value);
  }

  String getComplexity() {
    int passedTestCount = 0;
    Iterable<String> keys = testStatus.keys;
    for (String key in keys) {
      if (testStatus[key]) {
        passedTestCount++;
      }
    }
    switch (passedTestCount) {
      case 1:
        return 'Very weak';
      case 2:
        return 'Weak';
      case 3:
        return 'Strong';
      case 4:
        return 'Very Strong';
      default:
        return '';
    }
  }

  hasLowercase(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }

  hasUppercase(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }

  hasNumber(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }

  hasSpecialCharacter(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
