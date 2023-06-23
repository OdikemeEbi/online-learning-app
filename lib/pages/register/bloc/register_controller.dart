import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/common/entities/widgets/flutter_toast.dart';
import 'package:we_learn/pages/register/bloc/register_bloc.dart';

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
      toastInfo(msg: 'Username cannot be empty');
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: 'email cannot be empty');
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: 'email cannot be empty');
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: 'email cannot be empty');
      return;
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        toastInfo(
            msg:
                'Email has been sent to register email to activate it, please check your email and click the link to activate it');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The emaiil is alrady in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email id is invalid');
      }
    }
  }
}
