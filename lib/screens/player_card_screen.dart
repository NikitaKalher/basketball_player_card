import 'package:flutter/material.dart';
import '../models/player.dart';
import '../utils/constants.dart';

class PlayerCardScreen extends StatelessWidget {
  final Player player;

  const PlayerCardScreen({required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite action
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Handle share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage(Constants.imageUrl),
                  backgroundColor: Colors.grey.shade200,
                  onBackgroundImageError: (exception, stackTrace) {
                    // Handle image loading error
                  },
                 // child: const Icon(Icons.person, size: 50, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Text(
                  player.position,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatsColumn(
                          label: 'Points Per Game',
                          value: player.stats['pointsPerGame']?.toStringAsFixed(1) ?? 'N/A',
                        ),
                        StatsColumn(
                          label: 'Assists Per Game',
                          value: player.stats['assistsPerGame']?.toStringAsFixed(1) ?? 'N/A',
                        ),
                        StatsColumn(
                          label: 'Rebounds Per Game',
                          value: player.stats['reboundsPerGame']?.toStringAsFixed(1) ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showDetailsDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('View Detailed Stats'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detailed Stats for ${player.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Points Per Game: ${player.stats['pointsPerGame']?.toStringAsFixed(1) ?? 'N/A'}'),
              Text('Assists Per Game: ${player.stats['assistsPerGame']?.toStringAsFixed(1) ?? 'N/A'}'),
              Text('Rebounds Per Game: ${player.stats['reboundsPerGame']?.toStringAsFixed(1) ?? 'N/A'}'),
              // Add more detailed stats as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class StatsColumn extends StatelessWidget {
  final String label;
  final String value;

  const StatsColumn({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
