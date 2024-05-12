import 'package:flutter/material.dart';
import 'package:flutter_tech_assignment/screens/home_screen/home_screen.dart';
import 'package:flutter_tech_assignment/screens/login_screen/login_screen.dart';
import 'consts/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        routes: {
          "loginScreen": (context) => LoginScreen(),
          "homeScreen": (context) => HomeScreen(),
        },
        home: LoginScreen());
  }
}
