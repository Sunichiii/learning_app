import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:e_learning/common/widgets/flutter_toast.dart';

import '../../../common/routes/names.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        print("DEBUG: Email entered -> $emailAddress");
        print("DEBUG: Password entered -> $password");

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

          print("DEBUG: FirebaseAuth credentials -> $credentials");
          print("DEBUG: Firebase User Type -> ${credentials.user.runtimeType}");
          print("DEBUG: Firebase User -> ${credentials.user}");
          print("DEBUG: User UID -> ${credentials.user?.uid}");
          print("DEBUG: User Email -> ${credentials.user?.email}");

          if (credentials.user is! User) {
            toastInfo(msg: "User does not exist.");
            return;
          }

          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "Your email is not verified.");
            return;
          }

          // User is verified and logged in
          toastInfo(msg: "Login successful!");
          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.APPLICATION);
          });

        } catch (e, stackTrace) {
          print("DEBUG: Error during login -> $e");
          print("DEBUG: StackTrace -> $stackTrace");
          toastInfo(msg: "Something went wrong. Try again.");
        }
      }
    } catch (e) {
      print("DEBUG: General error -> $e");
      toastInfo(msg: "Something went wrong. Try again.");
    }
  }

}
