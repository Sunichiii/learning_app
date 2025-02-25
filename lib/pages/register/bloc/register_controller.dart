import 'package:e_learning/common/widgets/flutter_toast.dart';
import 'package:e_learning/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Confirm password cannot be empty");
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "Passwords do not match");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        try {
          await credential.user!.sendEmailVerification();
          await credential.user!.updateDisplayName(userName);
          toastInfo(
              msg:
                  "An email verification link has been sent. Please check your inbox.");
          Navigator.of(context).pop(); // Go back to login page
        } catch (e) {
          toastInfo(
              msg: "Failed to send verification email. Please try again.");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "The email is invalid");
      }
    }
  }
}
