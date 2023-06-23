import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_blocs.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_events.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_state.dart';
import 'package:we_learn/pages/signin/sign_in_controller.dart';
// import 'package:we_learn/pages/signin/widgets/sign_in_widget.dart';
import 'package:we_learn/pages/common_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Log In'),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyWidget(context),
                    Center(
                        child: reuseableText(
                            'Or use your email account to login')),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText('Email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'Enter your Email Address', 'Email', 'user',
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          reuseableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          forgotPassword(),
                          buildLogiInAndRegButton('Log In', 'login', () {
                            SignInController(context: context)
                                .handleSignIn('email');
                          }),
                          buildLogiInAndRegButton('Register', 'register', () {
                            Navigator.of(context).pushNamed('/register');
                          }),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
