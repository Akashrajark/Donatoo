import 'package:donatoo/ui/homescreen.dart';
import 'package:donatoo/ui/sing_in.dart';

import 'package:donatoo/ui/verify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
