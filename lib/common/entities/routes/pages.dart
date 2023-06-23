import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/common/entities/routes/routes.dart';
import 'package:we_learn/home/bloc/home_page_blocs.dart';
import 'package:we_learn/home/homePage.dart';
import 'package:we_learn/pages/application/application_page.dart';
import 'package:we_learn/pages/application/bloc/app_blocs.dart';
import 'package:we_learn/pages/profile/widgets/settngs/bloc/settings_bloc.dart';
import 'package:we_learn/pages/profile/widgets/settngs/settings.page.dart';
import 'package:we_learn/pages/register/bloc/register_bloc.dart';
import 'package:we_learn/pages/register/register.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_blocs.dart';
import 'package:we_learn/pages/signin/sign_in.dart';
import 'package:we_learn/pages/welcome/bloc/welcome_bloc.dart';
import 'package:we_learn/pages/welcome/welcome.dart';

import '../../../global.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBolcs(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingBlocs(),
          ))
    ];
  }

  // Return allb bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name when navigating get triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // print('first log');
        print(result.first.route);
        // print('valid route name ${settings.name}');
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }

          // print('second log');

          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print('invalid route name ${settings.name}');

    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

// Unify BlocProviders and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
