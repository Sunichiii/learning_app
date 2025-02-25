class RegisterStates {
  String userName;
  String email;
  String password;
  String rePassword;

// {} bhayo bhane optional named parameter
  RegisterStates(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    //mathi {} ma bhayera sabaikura ko namm rakhnu paryo
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
