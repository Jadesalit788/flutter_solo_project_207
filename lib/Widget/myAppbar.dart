import 'package:flutter/material.dart';

class myAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const myAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) {
            return GestureDetector(
              child: Image.asset(
                'assets/logo1.png',
                width: 30,
                height: 30,
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      title: Text(this.title),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 23,
        color: Colors.black,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
