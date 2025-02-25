class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email??this.email,
      password: password??this.password,

    );
  }
}
//3:25
//yo copy with method chai good wala method ho junchai state ko lagi huncha