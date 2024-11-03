import 'package:flutter/material.dart';
import 'package:sport_events_app/data/models/sports_event.dart';

class EventTimeRange extends StatelessWidget {
  const EventTimeRange({
    super.key,
    required this.event,
  });

  final SportsEvent event;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${event.dateStarting} | ${event.getTimeRange()}",
      style: const TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
