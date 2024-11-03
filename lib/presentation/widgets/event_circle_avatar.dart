import 'package:flutter/material.dart';
import 'package:sport_events_app/presentation/design_system.dart/app_colors.dart';

class EventCircleAvatar extends StatelessWidget {
  const EventCircleAvatar({
    super.key,
    required this.formattedLeague,
  });

  final String formattedLeague;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.secondary,
      radius: 36,
      child: Padding(
        padding: formattedLeague.contains('\n')
            ? const EdgeInsets.only(top: 4)
            : const EdgeInsets.only(top: 1),
        child: formattedLeague.contains('\n')
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  textAlign: TextAlign.center,
                  formattedLeague.split('\n')[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  formattedLeague.split('\n')[1],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ])
            : Text(
                textAlign: TextAlign.center,
                formattedLeague,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
