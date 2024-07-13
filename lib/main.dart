import 'package:basketball_player_card/screens/player_card_screen.dart';
import 'package:basketball_player_card/utils/constants.dart';
import 'package:flutter/material.dart';
import 'models/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Dev Assessment',
      home: PlayerCardScreen(
        player: Player(
          name: 'Nikita Kalher',
          image: Constants.imageUrl,
          position: 'Point Guard',
          stats: {
            'pointsPerGame': 25.4,
            'assistsPerGame': 7.1,
            'eboundsPerGame': 10.5,
          },
        ),
      ),
    );
  }
}