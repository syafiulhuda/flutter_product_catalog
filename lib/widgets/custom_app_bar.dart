import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTile;
  final Widget widget;
  final Color? color;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.centerTile = true,
    this.color = Colors.greenAccent,
    required this.widget,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTile,
      backgroundColor: color,
      title: widget,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
