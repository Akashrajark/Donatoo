import 'package:donatoo/bloc/profile/profile_bloc.dart';
import 'package:donatoo/ui/widget/custom_alert_dialog.dart';
import 'package:donatoo/ui/widget/custom_dialog.dart';
import 'package:donatoo/values/colors.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
    profileBloc.add(ProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>.value(
      value: profileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
                primaryButtonLabel: 'Try Again',
                primaryOnPressed: () {
                  profileBloc.add(ProfileEvent());
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: secondaryColor,
            appBar: AppBar(
              backgroundColor: secondaryColor,
              elevation: 0,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                ),
              ),
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CustomDialog(
                            label: 'FeedBack',
                          ),
                        );
                      },
                      child: const Text('Feedback'),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              ],
              title: Text(
                "Profile",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            body: state is ProfileSuccessState
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hi,",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 2.5,
                                  ),
                                  Text(
                                    state.profileDetails['user_name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                title: 'Logout?',
                                message: 'Are you sure you want to logout?',
                                primaryButtonLabel: 'Logout',
                                primaryOnPressed: () {},
                                secondaryButtonLabel: 'Cancel',
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Your total request donation is",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.profileDetails['req_pay'].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your total oraganisation donation is",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.profileDetails['org_pay'].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class CustomAmountBox extends StatelessWidget {
  final String label, amount;
  const CustomAmountBox({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  amount,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          )),
    );
  }
}

class ProfileCustomButton extends StatelessWidget {
  final bool isActive;
  final Function() onTap;
  final String text;
  const ProfileCustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: isActive ? primaryColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleMedium,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
