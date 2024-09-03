
String? validatePhoneNumber(String? phoneNumber) {
  RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
  final isPhoneValid = phoneRegex.hasMatch(phoneNumber ?? "");
  if (!isPhoneValid) {
    return 'Hãy nhập số điện thoại';
  }
  return null;
}

String? validatePassword(String? password){
  if(password!.isEmpty){
    return 'Hãy nhập mật khẩu';
  }
  if(password.length<6){
    return'Mật khẩu phải trên 6 kí tự';
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Hãy điền xác nhận mật khẩu';
  }
  if (password != confirmPassword) {
    return 'Xác nhận mật khẩu không chính xác';
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

String? validateAddress(String? address) {
  if (address == null || address.trim().isEmpty) {
    return 'Vui lòng nhập địa chỉ';
  }
  if (address.trim().length < 6) {
    return 'Địa chỉ phải có ít nhất 6 ký tự';
  }
  return null;
}