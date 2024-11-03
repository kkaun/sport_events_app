import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  // Using flutter_riverpod as a minimalistic and universal solution
  // for both DI and state management, in order to demonstrate
  // base app scalability and architecture/structuring possibilities:
  runApp(const ProviderScope(child: SportsEventsApp()));
}

class SportsEventsApp extends StatelessWidget {
  const SportsEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Events App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomeScreen(),
    );
  }
}
