import 'package:donatoo/ui/screens/signup_screen.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/screens/homescreen.dart';
import 'ui/screens/sign_in.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          hintStyle: GoogleFonts.roboto(
            textStyle: ThemeData.light().textTheme.titleMedium!.copyWith(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignInScreen(),
        '/SignIn': (context) => const SignInScreen(),
        '/SignUp': (context) => const SignUpScreen(),
        '/Home': (context) => const HomeScreen(),
      },
    ),
  );
}
