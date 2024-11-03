import 'package:flutter/material.dart';
import 'package:sport_events_app/data/models/sports_event.dart';

/// As long as the event model implies img urls usage,
/// the real urls from the internet are mocked and rendered.
class EventImage extends StatelessWidget {
  const EventImage({
    super.key,
    required this.event,
  });

  final SportsEvent event;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      event.iconUrl,
      height: 80,
      width: 80,
      fit: BoxFit.contain,
    );
  }
}
