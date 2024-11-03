// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events_app/presentation/widgets/common_app_bar.dart';
import 'package:sport_events_app/presentation/widgets/date_filter.dart';
import 'package:sport_events_app/presentation/widgets/event_card.dart';
import 'package:sport_events_app/presentation/view_models/sports_events_view_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // For simplicity, keeping the string date representations,
  // as required in the task:
  String selectedDate = "Today";

  @override
  void initState() {
    super.initState();
    // Fetch sports events when the screen is initialized:
    ref.read(sportsEventsViewModelProvider.notifier).fetchSportsEvents();
  }

  @override
  Widget build(BuildContext context) {
    // Watching for the sports events:
    // not the most elegant approach, but for simple test app should be sufficient.
    final sportsEventsList = ref.watch(sportsEventsViewModelProvider);
    final filteredEvents = sportsEventsList?.events
            .where((event) => event.dateStarting == selectedDate)
            .toList() ??
        [];

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          DateFilter(
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          Expanded(
            child: sportsEventsList == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = filteredEvents[index];
                      return EventCard(event: event);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
