import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:e_learning/common/widgets/flutter_toast.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "Please enter your email.");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Please enter your password.");
          return;
        }

        try {
          final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credentials.user == null) {
            toastInfo(msg: "User does not exist.");
            return;
          }

          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "Your email is not verified.");
            return;
          }

          // User is verified and logged in
          toastInfo(msg: "Login successful!");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found with this email.");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Incorrect password.");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid email format.");
          } else {
            toastInfo(msg: "Authentication error: ${e.message}");
          }
        }
      }
    } catch (e) {
      print("Error: $e");
      toastInfo(msg: "Something went wrong. Try again.");
    }
  }
}
