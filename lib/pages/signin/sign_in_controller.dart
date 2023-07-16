import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:we_learn/common/entities/entities.dart';
import 'package:we_learn/common/entities/value/constant.dart';
import 'package:we_learn/common/entities/widgets/flutter_toast.dart';
import 'package:we_learn/global.dart';
import 'package:we_learn/home/home_controller.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_blocs.dart';

import '../../common/entities/apis/user_api.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: ' You need to fill email address');
          // print('email is emppty');
        }
        if (password.isEmpty) {
          // print('password is emppty');
          toastInfo(msg: ' You need to enter your password');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            // print('user doesnt exist');
            toastInfo(msg: ' No user found');
            return;
          }
          if (!credential.user!.emailVerified) {
            // print('Email is not verified');
            toastInfo(msg: ' You need to verify email address');
            return;
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            // print("user open_id ${id}");
            // print("user photourl ${photoUrl}");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            // type one means email login
            loginRequestEntity.type = 1;

            print('User Exist');
            // toastInfo(msg: ' You not a user');
            // return;
            await asyncPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }
            // Global.storageService
            //     .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            toastInfo(msg: 'no user found');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            // print('no user found for that emaiil');
            toastInfo(msg: 'No user found');
            return;
          } else if (e.code == 'wrong-password') {
            // print('wrong password provided for that user');
            toastInfo(msg: ' You provided a wrong password');
            return;
          } else if (e.code == 'invalid-email') {
            // print('email not correct');
            toastInfo(msg: ' You email address is badly formatted');
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    var result = await UserAPI.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/application", (route) => false);
        }
      } catch (e) {
        print("saving local storage error ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'unknown error');
    }
  }
}
