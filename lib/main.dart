import 'package:e_learning/common/routes/pages.dart';
import 'package:e_learning/pages/application/application_page.dart';
import 'package:e_learning/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/values/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      // Sabai valid BlocProvider haru pass gareko (Passing all valid BlocProviders)
      child: ScreenUtilInit(
        designSize: const Size(375,812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: ApplicationPage(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}

