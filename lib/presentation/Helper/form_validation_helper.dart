

class FormValidationHelper{

   static FormValidationHelper? _helper;

   FormValidationHelper._();

   static FormValidationHelper get emailHelper=>_helper??FormValidationHelper._();

  bool isValidEmail(String email) {

    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}