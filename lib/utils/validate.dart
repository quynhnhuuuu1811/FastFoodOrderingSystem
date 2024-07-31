
String? validatePhoneNumber(String? phoneNumber) {
  RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
  final isPhoneValid = phoneRegex.hasMatch(phoneNumber ?? "");
  if (!isPhoneValid) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? validatePassword(String? password){
  if(password==null){
    return 'Please type a password';
  }
  if(password.length<6){
    return'Your password should at least be 6 character';
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateFullName(String? fullName) {
  if (fullName == null || fullName.trim().isEmpty) {
    return 'Vui lòng nhập họ tên';
  }
  List<String> names = fullName.trim().split(' ');
  if (names.length < 2) {
    return 'Vui lòng nhập đầy đủ họ và tên';
  }
  if (fullName.trim().length < 6) {
    return 'Họ tên phải có ít nhất 6 ký tự';
  }
  return null;
}