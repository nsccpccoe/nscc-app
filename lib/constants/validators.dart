class MyValidators {
  static String? v_name(String? value) {
    if (value == null || value.isEmpty)
      return "please enter usernane";
    else {
      return null;
    }
  }

  static String? v_email(String? value) {
    final emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // final emailPattern = r'^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';

    final emailRegExp = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Please enter email Id";
    } else if (emailRegExp.hasMatch(value)) {
      return null;
    } else {
      return "Please Enter valid email Id";
    }
  }

  static String? v_pass(String? value) {
    if (value == null || value.isEmpty)
      return "please enter password";
    else if (value.length < 6) {
      return "Password should be more than 6 Digits";
    } else {
      return null;
    }
  }
}
