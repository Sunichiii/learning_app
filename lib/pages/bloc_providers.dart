import 'package:e_learning/pages/register/bloc/register_blocs.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegisterBlocs()),
  ];
}