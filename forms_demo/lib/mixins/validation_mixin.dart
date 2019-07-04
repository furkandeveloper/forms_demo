class ValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "First Name at least 2 character sets. ";
    }
    return null;
  }

   String validateLastName(String value) {
    if (value.length < 2) {
      return "Last Name at least 2 character sets. ";
    }
    return null;
  }

   String validateEmail(String value) {
    if (!value.contains("@")) {
      return "Email field is not in proper format";
    }
    return null;
  }

   String validatePassword(String value) {
    if (value.length < 4) {
      return "Password at least 4 character sets. ";
    }
    return null;
  }
}
