class Helpers {
  static bool isPhoneNumberValid(String input) {
    // Define a regular expression pattern for a Pakistani phone number.
    // Pakistani phone numbers usually have a format like "03xx-xxxxxxx" or "+92 3xx-xxxxxxx".
    final RegExp pakistanPhoneNumberRegex = RegExp(
      // r"^(?:\+92|0)[1-9]\d{9}$",
      r"^0\d{10}$",
    );

    // Use the RegExp's hasMatch method to check if the input matches the pattern.
    return pakistanPhoneNumberRegex.hasMatch(input);
  }
}
