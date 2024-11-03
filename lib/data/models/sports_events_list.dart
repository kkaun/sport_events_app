import 'sports_event.dart';

/// Sports events list data class
class SportsEventsList {
  final List<SportsEvent> events;

  SportsEventsList({required this.events});

  factory SportsEventsList.fromList(List<Map<String, dynamic>> list) {
    List<SportsEvent> events =
        list.map((map) => SportsEvent.fromMap(map)).toList();
    return SportsEventsList(events: events);
  }

  List<Map<String, dynamic>> toList() {
    return events.map((event) => event.toMap()).toList();
  }
}
