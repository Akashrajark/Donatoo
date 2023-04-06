import 'package:donatoo/ui/screens/profile_screen.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emergency_page.dart';
import 'organization_page.dart';
import 'request_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            Emergency(),
            Organization(),
            Request(),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButton(
            iconData: Icons.emergency,
            text: "Emergency",
            isActive: _tabController.index == 0,
            onTap: () {
              _tabController.animateTo(0);
            },
          ),
          CustomIconButton(
            iconData: Icons.volunteer_activism,
            text: "Organization",
            onTap: () {
              _tabController.animateTo(1);
            },
            isActive: _tabController.index == 1,
          ),
          CustomIconButton(
            iconData: Icons.playlist_add_check_rounded,
            text: "Request",
            onTap: () {
              _tabController.animateTo(2);
            },
            isActive: _tabController.index == 2,
          ),
          CustomIconButton(
            iconData: Icons.account_box_outlined,
            text: "profile",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final bool isActive;
  final Function() onTap;
  final String text;
  final IconData iconData;
  const CustomIconButton({
    Key? key,
    this.isActive = false,
    required this.onTap,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: isActive ? primaryColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Icon(
                iconData,
                color: isActive ? Colors.white : primaryColor,
              ),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(text,
                          style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          )),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
