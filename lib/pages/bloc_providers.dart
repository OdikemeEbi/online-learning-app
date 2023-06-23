import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/register/bloc/register_bloc.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_blocs.dart';
import 'package:we_learn/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: ((context) => WelcomeBloc()),
        ),
        BlocProvider(
          lazy: false,
          create: ((context) => SignInBloc()),
        ),
        BlocProvider(
          lazy: false,
          create: ((context) => RegisterBlocs()),
        ),
      ];
}
