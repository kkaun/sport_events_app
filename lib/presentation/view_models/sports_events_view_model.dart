import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events_app/data/models/sports_events_list.dart';
import 'package:sport_events_app/data/repositories.dart/sports_events_repository.dart';

// Riverpod provider for SportsEventsViewModel, injecting the repository provider
final sportsEventsViewModelProvider =
    StateNotifierProvider<SportsEventsViewModel, SportsEventsList?>((ref) {
  final repository = ref.read(sportsEventsRepositoryProvider);
  return SportsEventsViewModel(repository);
});

/// Sports events VM class, which provides bit more advanced state management capabilities
class SportsEventsViewModel extends StateNotifier<SportsEventsList?> {
  final SportsEventsRepository repository;

  SportsEventsViewModel(this.repository) : super(null);

  // Getter to retrieve cached sports events
  SportsEventsList? get sportsEvents => state;

  // Method to fetch sports events and cache them
  Future<void> fetchSportsEvents() async {
    state = await repository.fetchSportsEvents();
  }
}
