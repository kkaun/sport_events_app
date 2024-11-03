import 'package:flutter/material.dart';
import 'package:sport_events_app/presentation/design_system.dart/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      // Using simple text here to save time w/o manual img cut,
      // because the source logo picture has bad padding:
      title: const Text(
        'TVG',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); // Default AppBar height
}
