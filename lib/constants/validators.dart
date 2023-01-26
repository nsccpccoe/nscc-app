class MyValidators {
  static String? v_name(String? value) {
    if (value == null || value.isEmpty)
      return "please enter usernane";
    else {
      return "";
    }
  }

  static String? v_pass(String? value) {
    if (value == null || value.isEmpty)
      return "please enter password";
    else if (value.length < 6) {
      return "Password should be more than 6 Digits";
    } else {
      return "";
    }
  }
}
