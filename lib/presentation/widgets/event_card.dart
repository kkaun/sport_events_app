import 'package:flutter/material.dart';
import 'package:sport_events_app/data/models/sports_event.dart';
import 'package:sport_events_app/presentation/widgets/event_circle_avatar.dart';
import 'package:sport_events_app/presentation/widgets/event_time_range.dart';
import '../screens/event_detail_screen.dart';

class EventCard extends StatelessWidget {
  final SportsEvent event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final String formattedLeague = event.getLeagueWithNewline();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event),
          ),
        );
      },
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Event icon
                  Image.network(
                    event.iconUrl,
                    height: 46,
                    width: 46,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  // Event details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventTimeRange(event: event),
                        const SizedBox(height: 1.5),
                        Text(
                          event.teams,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  // League badge
                  EventCircleAvatar(formattedLeague: formattedLeague)
                ],
              ),
              const SizedBox(height: 12),
              Container(height: 1, color: Colors.black12)
            ],
          ),
        ),
      ),
    );
  }
}
