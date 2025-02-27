import 'package:e_learning/pages/application/application_page.dart';
import 'package:e_learning/pages/application/bloc/app_blocs.dart';
import 'package:e_learning/pages/home/home_page.dart';
import 'package:e_learning/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:e_learning/pages/profile/settings/settings.dart';
import 'package:e_learning/pages/register/bloc/register_blocs.dart';
import 'package:e_learning/pages/register/register.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:e_learning/pages/sign_in/sign_in.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/home/bloc/home_page_blocs.dart';
import 'names.dart';

class AppPages {
  static List<PagesEntity> routes() {
    return [
      PagesEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PagesEntity(
        route: AppRoutes.SIGN_IN,
        page: SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PagesEntity(
        route: AppRoutes.REGISTER,
        page: Register(),
        bloc: BlocProvider(create: (_) => RegisterBlocs()),
      ),
      PagesEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PagesEntity(
        route: AppRoutes.HOME_PAGE,
        page: HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs()),
      ),
      PagesEntity(
          route: AppRoutes.SETTINGS,
          page: SettingsPage(),
          bloc: BlocProvider(create: (_) => SettingsBlocs()),
      )
    ];
  }

  // Sabai bloc provider haru return gareko (Returning all bloc providers)
  static List<BlocProvider> allBlocProviders(BuildContext context) {
    return routes()
        .map((page) => page.bloc) // Bloc extract gareko (Extracting the bloc)
        .whereType<BlocProvider>() // Null hataune (Removing null values)
        .toList(); // List ma convert gareko (Converting to a list)
  }

  // Model that covers entire screen
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

// Sabai bloc provider ra routes sangai rakheko (Keeping all bloc providers and routes together)
class PagesEntity {
  String route;
  Widget page;
  dynamic bloc;

  PagesEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
