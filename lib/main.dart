// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'dart:ui';
import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_final_page/cubit/auth_cubit.dart';
import 'package:the_final_page/firebase_options.dart';
import 'package:the_final_page/pages/categories.dart';
import 'package:the_final_page/pages/home_page.dart';
import 'package:the_final_page/pages/login_page.dart';
import 'package:the_final_page/pages/onboarding_page.dart';
import 'package:the_final_page/pages/page2.dart';
import 'package:the_final_page/pages/reset_password_page.dart';
import 'package:the_final_page/pages/signup_page.dart';
import 'package:the_final_page/pages/splash_page.dart';
import 'package:the_final_page/services/pref.service.dart';
import 'package:the_final_page/utils/color_utilis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp(
    DevicePreview(
      // child: MultiBlocProvider(
      // providers: [BlocProvider(create: (ctx) => AuthCubit())],

      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      // scrollBehavior: _CustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: ColorUtility.gbScaffold,
        fontFamily: ' PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUtility.main),
        useMaterial3: true,
      ),
      // onGenerateRoute: (settings) {
      //   final String routeName = settings.name ?? '';
      //   final Map? data = settings.arguments as Map?;
      //   switch (routeName) {
      //     case LoginPage.id:
      //       return MaterialPageRoute(builder: (context) => LoginPage());
      //     case SignUpPage.id:
      //       return MaterialPageRoute(builder: (context) => SignUpPage());
      //     case ResetPasswordPage.id:
      //       return MaterialPageRoute(builder: (context) => ResetPasswordPage());
      //     case OnBoardingPage.id:
      //       return MaterialPageRoute(builder: (context) => OnBoardingPage());
      //     case HomePage.id:
      //       return MaterialPageRoute(builder: (context) => HomePage());

      //     default:
      //       return MaterialPageRoute(builder: (context) => SplashPage());
      //   }
      // },
      // initialRoute: SplashPage.id,
      home: CategoriesPage(),
    );
  }
}

// class _CustomScrollBehaviour extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.mouse,
//         PointerDeviceKind.touch,
//       };
      
// }
