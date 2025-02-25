import 'package:e_learning/pages/application/application_page.dart';
import 'package:e_learning/pages/bloc_providers.dart';
import 'package:e_learning/pages/register/register.dart';
import 'package:e_learning/pages/sign_in/sign_in.dart';
import 'package:e_learning/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/values/colors.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child:ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText
              ),
              elevation: 0,
              backgroundColor: Colors.white
            ),
          ),
          home: ApplicationPage(),
          routes: {
            'homePage': (context) => MyHomePage(),
            'signIn': (context) => SignIn(),
            'register': (context) => Register(),
          },
        ),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("My Home Page"),),
    );
  }
}

