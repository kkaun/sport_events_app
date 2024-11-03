import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events_app/data/models/sports_events_list.dart';
import 'package:sport_events_app/data/datasources/sports_events_datasource.dart';

// Riverpod provider for SportsEventsRepository, injecting the datasource provider
final sportsEventsRepositoryProvider = Provider<SportsEventsRepository>((ref) {
  final datasource = ref.read(sportsEventsDatasourceProvider);
  return SportsEventsRepository(datasource);
});

/// Sports events repository
class SportsEventsRepository {
  final SportsEventsDatasource datasource;

  SportsEventsRepository(this.datasource);

  Future<SportsEventsList> fetchSportsEvents() async {
    return datasource.fetchSportsEvents();
  }
}
