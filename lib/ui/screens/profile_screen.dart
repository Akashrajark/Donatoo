import 'package:donatoo/ui/widget/custom_dialog.dart';
import 'package:donatoo/values/colors.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_button.dart';
import '../widget/custom_small_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          PopupMenuButton(
            color: primaryColor,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 0,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const CustomDialog(
                              label: 'FeedBack',
                            ));
                  },
                  child: Text(
                    "FeedBack",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(
                  "About us",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ],
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Akashraj k",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "+91 1234567890",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Your total donation is",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "60000",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "your donation history",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: ProfileCustomButton(
                    text: "Request",
                    isActive: _tabController.index == 0,
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ProfileCustomButton(
                    text: "Organization",
                    isActive: _tabController.index == 1,
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            20,
                            (index) => const CustomAmountBox(
                                  label: "Request",
                                  amount: "\$30",
                                )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            20,
                            (index) => const CustomAmountBox(
                                  label: "Organization",
                                  amount: "\$50",
                                )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          text: "Support us",
          onTap: () {},
        ),
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
