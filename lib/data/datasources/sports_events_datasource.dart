import 'package:sport_events_app/data/models/sports_events_list.dart';
import 'package:sport_events_app/data/datasources/sports_events_static_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod provider for SportsEventsDatasource
final sportsEventsDatasourceProvider = Provider<SportsEventsDatasource>((ref) {
  return SportsEventsDatasource();
});

/// Datasource for sports events
class SportsEventsDatasource {
  Future<SportsEventsList> fetchSportsEvents() async {
    return SportsEventsList.fromList(SportsEventsStaticData.sportsEvents);
  }
}
