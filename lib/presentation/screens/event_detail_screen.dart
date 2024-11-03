import 'package:flutter/material.dart';
import 'package:sport_events_app/data/models/sports_event.dart';
import 'package:sport_events_app/presentation/widgets/common_app_bar.dart';
import 'package:sport_events_app/presentation/widgets/event_circle_avatar.dart';
import 'package:sport_events_app/presentation/widgets/event_image.dart';
import 'package:sport_events_app/presentation/widgets/event_time_range.dart';

class EventDetailScreen extends StatelessWidget {
  final SportsEvent event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final String formattedLeague = event.getLeagueWithNewline();

    return Scaffold(
      // Note: I don't see any logical reason to keep the date filter bar
      // in detail screen, as was shown in the prototype. So, skipping it here.
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _backButton(context),
              const SizedBox(height: 55),
              EventCircleAvatar(formattedLeague: formattedLeague),
              const SizedBox(height: 30),
              EventTimeRange(event: event),
              const SizedBox(height: 5),
              Text(event.teams,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Container(height: 1, color: Colors.black12),
              const SizedBox(height: 20),
              EventImage(event: event),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '''Gummi bears cupcake sesame snaps cupcake bonbon. Halvah muffin biscuit brownie bear claw cookie croissant. Sugar plum candy canes brownie topping pudding jelly-o chocolate cake lollipop.\n\nChocolate cake chupa chups shortbread apple pie chocolate bar jelly beans chocolate carrot cake danish. Lemon drops jujubes chocolate sesame snaps marshmallow. Sesame snaps sweet roll oat cake.''',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back, color: Colors.black45, size: 20),
            SizedBox(width: 5),
            Text(
              "Go Back",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
