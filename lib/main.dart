import 'package:flutter/material.dart';

import 'ui/screens/homescreen.dart';
import 'ui/screens/sing_in.dart';
import 'ui/screens/splashscreen.dart';
import 'ui/screens/verify.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/SingIn': (context) => const SingIn(),
        '/Verify': (context) => const Verify(),
        '/Home': (context) => const HomeScreen(),
      },
    ),
  );
}
