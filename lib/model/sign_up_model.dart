class SignUpModel {
  String? _username;
  String? _password;
  String? _email;
  String? _address;
  String? _city;
  String? _province;
  String? _gender;
  bool _hobby1 = false;
  bool _hobby2 = false;

  String? get username {
    return _username;
  }

  set username(String? value) {
    _username = value;
  }

  String? get password {
    return _password;
  }

  set password(String? value) {
    _password = value;
  }

  String? get email {
    return _email;
  }

  set email(String? value) {
    _email = value;
  }

  String? get address {
    return _address;
  }

  set address(String? value) {
    _address = value;
  }

  String? get city {
    return _city;
  }

  set city(String? value) {
    _city = value;
  }

  String? get province {
    return _province;
  }

  set province(String? value) {
    _province = value;
  }

  String? get gender {
    return _gender;
  }

  set gender(String? value) {
    _gender = value;
  }

  bool get hobby1 {
    return _hobby1;
  }

  set hobby1(bool value) {
    _hobby1 = value;
  }

  bool get hobby2 {
    return _hobby2;
  }

  set hobby2(bool value) {
    _hobby2 = value;
  }
}
