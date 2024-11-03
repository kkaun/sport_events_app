/// Sports event data class
class SportsEvent {
  final String iconUrl;
  final String league;
  final String teams;
  final String sportType;
  final String dateStarting;
  final String timeStarting;
  // To comply the prototype, timeEnding field was added
  // both to data class and mock dataset:
  final String timeEnding;

  SportsEvent({
    required this.iconUrl,
    required this.league,
    required this.teams,
    required this.sportType,
    required this.dateStarting,
    required this.timeStarting,
    required this.timeEnding,
  });

  factory SportsEvent.fromMap(Map<String, dynamic> map) {
    return SportsEvent(
      iconUrl: map['iconUrl'] ?? '',
      league: map['league'] ?? '',
      teams: map['teams'] ?? '',
      sportType: map['sportType'] ?? '',
      dateStarting: map['dateStarting'] ?? '',
      timeStarting: map['timeStarting'] ?? '',
      timeEnding: map['timeEnding'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iconUrl': iconUrl,
      'league': league,
      'teams': teams,
      'sportType': sportType,
      'dateStarting': dateStarting,
      'timeStarting': timeStarting,
      'timeEnding': timeEnding,
    };
  }

  //Utility method to format league name with new lines
  String getLeagueWithNewline() {
    return league.replaceAll(' ', '\n');
  }

  //Utility method to return time range in "start - end" format
  String getTimeRange() {
    return "$timeStarting - $timeEnding";
  }
}
