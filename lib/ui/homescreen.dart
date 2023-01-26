import 'package:donatoo/ui/request_page.dart';
import 'package:flutter/material.dart';
import 'emergency_page.dart';
import 'organization_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          Emergency(),
          Organization(),
          Request(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIconButton(
            isActive: true,
            onTap: () {},
          ),
          CustomIconButton(
            onTap: () {},
            isActive: false,
          ),
          CustomIconButton(
            onTap: () {},
            isActive: false,
          ),
          CustomIconButton(
            onTap: () {},
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final bool isActive;
  final Function() onTap;
  const CustomIconButton({
    Key? key,
    this.isActive = true,
    required this.onTap,
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
              const Icon(Icons.emergency),
              isActive
                  ? const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Emergency"),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
