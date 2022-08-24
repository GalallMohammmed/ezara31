import 'dart:io';

import 'package:ezara3_1/Cubit/cubit.dart';
import 'package:ezara3_1/Cubit/states.dart';
import 'package:ezara3_1/app_cubit/app_states.dart';
import 'package:ezara3_1/app_cubit/cubit.dart';
import 'package:ezara3_1/login_register/loginRegister.dart';
import 'package:ezara3_1/login_register/registerCubit/registerCubit.dart';
import 'package:ezara3_1/network/remote/dioHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:splashscreen/splashscreen.dart';

import 'Cubit/my_bloc_observer.dart';
import 'bottom_navigation_bar_screens/qr_code.dart';
import 'layout/splashScreen.dart';
import 'login_register/home_bottom_navigation_bar.dart';
import 'login_register/loginCubit/loginCubit.dart';

void initialization()async{
  await Future.delayed(const Duration(seconds: 1));
  // FlutterNativeSplash.remove();
}

void main() {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer=my_bloc_observer();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) => PlanetCubit()),
              BlocProvider(
                  create: (BuildContext context) => SignInCubit()),
              BlocProvider(
                  create: (BuildContext context) => RegisterCubit()),
              // BlocProvider(
              //     create: (BuildContext context) => PlanetCubit()..getProductsData()),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: BottomNavigationBarScreen(),
    // SplashScreen(
              //     seconds: 3,
              //     navigateAfterSeconds: ,
              //   image:Image(image:AssetImage('images/splash.jpeg'), ) ,
              //   backgroundColor: Colors.white,
              //     ),
            ),
          );
    //     },
    //   ),
    // );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}