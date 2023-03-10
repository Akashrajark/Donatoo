import 'package:flutter/material.dart';
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
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          Emergency(),
          Organization(),
          Request(),
          Request(),
        ],
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
              _tabController.animateTo(3);
            },
            isActive: _tabController.index == 3,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
