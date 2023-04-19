import 'package:donatoo/ui/screens/homescreen.dart';
import 'package:donatoo/ui/screens/sign_in.dart';
import 'package:donatoo/ui/widget/custom_small_button.dart';
import 'package:donatoo/util/validaters.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Donatoo",
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splashimage.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Column(
                        children: [
                          Text(
                            'Sign up to donatoo',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                hintText: 'Full Name',
                                border: OutlineInputBorder(),
                              ),
                              validator: fullName),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_rounded,
                              ),
                              hintText: 'Email Address',
                              border: OutlineInputBorder(),
                            ),
                            validator: email,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            validator: password,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _contactController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Contact Number',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: phoneNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonType: ButtonType.primary,
                    text: 'Sign up',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (Route<dynamic> route) => true,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Already have an Account?",
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple,
                              ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: "Sign in",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    buttonType: ButtonType.secondary,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
