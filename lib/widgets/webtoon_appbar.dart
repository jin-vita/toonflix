import 'package:flutter/material.dart';

class WebToonAppBar extends StatelessWidget with PreferredSizeWidget {
  const WebToonAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
