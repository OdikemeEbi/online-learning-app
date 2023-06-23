import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/pages/common_widget.dart';
import 'package:we_learn/pages/register/bloc/register_bloc.dart';
import 'package:we_learn/pages/register/bloc/register_controller.dart';
import 'package:we_learn/pages/register/bloc/register_event.dart';
import 'package:we_learn/pages/register/bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: reuseableText(
                            'Enter your details below and free sign up')),
                    Container(
                      margin: EdgeInsets.only(top: 50.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText('Username'),
                          buildTextField(
                              'Enter your  username', 'username', 'user',
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(UserNameEvent(value));
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          reuseableText('Email'),
                          buildTextField(
                              'Enter your email address', 'email', 'lock',
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(EmailEvent(value));
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          reuseableText('Password'),
                          buildTextField(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(PasswordEvent(value));
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          reuseableText('Confirm Password'),
                          buildTextField(
                              'confirm your password', 'password', 'lock',
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RePasswordEvent(value));
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                              // margin: EdgeInsets.only(left: 25.w),
                              child: reuseableText(
                                  'enter your details below to sign up')),
                          buildLogiInAndRegButton('Sign Up', 'login', () {
                            // Navigator.of(context).pushNamed('register');
                            RegisterController(context: context)
                                .handleEmailRegister();
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
