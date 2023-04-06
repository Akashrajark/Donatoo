import 'package:donatoo/ui/screens/create_request.dart';
import 'package:donatoo/ui/screens/splashscreen.dart';

import 'package:flutter/material.dart';

import 'ui/screens/homescreen.dart';
import 'ui/screens/sing_in.dart';
import 'ui/screens/verify.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/SingIn': (context) => const SingIn(),
        '/Verify': (context) => const Verify(),
        '/Home': (context) => const HomeScreen(),
      },
    ),
  );
}
