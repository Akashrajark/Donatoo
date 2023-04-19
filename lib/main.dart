import 'package:donatoo/ui/screens/signup_screen.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/screens/homescreen.dart';
import 'ui/screens/sign_in.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://autcpaoiguonohmlwvub.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF1dGNwYW9pZ3Vvbm9obWx3dnViIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODEyOTQ1NDQsImV4cCI6MTk5Njg3MDU0NH0.LmErf0I1HObrmPNuYTqrY7lK4hSL1gYrNE4u46Iqdr8',
  );

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
