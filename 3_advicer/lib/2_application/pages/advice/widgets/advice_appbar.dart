import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviceAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AdviceAppbar({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Advice", style: themeData.textTheme.headline1),
      centerTitle: true,
      actions: [
        Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppTheme.appBarHeight);
}
