import 'package:donatoo/ui/screens/homescreen.dart';
import 'package:donatoo/ui/screens/signup_screen.dart';
import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/ui/widget/custom_small_button.dart';
import 'package:donatoo/util/validaters.dart';
import 'package:donatoo/values/colors.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../bloc/auth/sign_in/sign_in_bloc.dart';
import '../widget/custom_alert_dialog.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (Supabase.instance.client.auth.currentUser != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (Route<dynamic> route) => true,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Login Failed',
                message: 'Please check your email and password and try again.',
                primaryButtonLabel: 'Ok',
                primaryOnPressed: () => Navigator.pop(context),
              ),
            );
          } else if (state is SignInSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (Route<dynamic> route) => true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'Sign In',
                style: GoogleFonts.roboto(
                  textStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Opacity(
                  opacity: .5,
                  child: Image.asset(
                    "assets/images/splashimage.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: secondaryColor.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Donatoo',
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 5,
                                  ),
                                  hintText: 'Email',
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.9),
                                  prefixIcon: const Icon(
                                    Icons.email_rounded,
                                  ),
                                ),
                                validator: email,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 5,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.9),
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _isObscure = !_isObscure;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                                validator: password,
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: "Sign In",
                                isLoading: state is SignInLoadingState,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignInBloc>(context).add(
                                      SignInEvent(
                                        email: _emailC.text.trim(),
                                        password: _passC.text.trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Don't have an Account?",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.deepPurple,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: "Register",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                buttonType: ButtonType.secondary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
