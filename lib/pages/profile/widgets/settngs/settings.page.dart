import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/common/entities/routes/routes.dart';
import 'package:we_learn/common/entities/value/constant.dart';
import 'package:we_learn/global.dart';
import 'package:we_learn/home/bloc/home_page_blocs.dart';
import 'package:we_learn/home/bloc/home_page_events.dart';
import 'package:we_learn/pages/application/bloc/app_blocs.dart';
import 'package:we_learn/pages/application/bloc/app_events.dart';
import 'package:we_learn/pages/profile/widgets/settngs/bloc/settings_bloc.dart';
import 'package:we_learn/pages/profile/widgets/settngs/bloc/settings_state.dart';
import 'package:we_learn/pages/profile/widgets/settngs/settings_widgets/setting_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    void removeUserData() {
      context.read<AppBlocs>().add(const TriggerAppEvent(0));
      context.read<HomePageBlocs>().add(const HomePageDots(0));
      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
    }

    return Scaffold(
      appBar: buildAppbars(),
      body:
          BlocBuilder<SettingBlocs, SettingStates>(builder: ((context, state) {
        return Container(
          child: Column(
            children: [
              settingsButton(context, removeUserData),
            ],
          ),
        );
      })),
    );
  }
}
