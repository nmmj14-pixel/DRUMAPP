import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const DrumPadApp());

// Function to play the respective sound
void playSound(String B) {
  final player = AudioPlayer();
  player.play(AssetSource('$B.wav')); // Play the sound file
}

class DrumPadApp extends StatelessWidget {
  const DrumPadApp({super.key});

  // Function to build each drum pad without label
  Widget buildDrumPad({required Color color, required String B}) {
    return GestureDetector(
      onTap: () {
        playSound(B); // Play the sound
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8), // Add some transparency for better background blending
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // Background Image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/backgrounddrum.jpg'), // Replace with your background image
                    fit: BoxFit.cover, // Ensures the image covers the screen
                  ),
                ),
              ),

              // Drum Pad Grid
              GridView.count(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 8, // Space between columns
                mainAxisSpacing: 8, // Space between rows
                padding: const EdgeInsets.all(16),
                children: [
                  // Add drum pads here
                  buildDrumPad(color: Colors.blue, B:  'sound1'),
                  buildDrumPad(color: Colors.pink, B: 'sound2'),
                  buildDrumPad(color: Colors.orange, B: 'hihat'),
                  buildDrumPad(color: Colors.green, B: 'tom1'),
                  buildDrumPad(color: Colors.yellow, B: 'tom2'),
                  buildDrumPad(color: Colors.purple, B: 'crash'),
                  buildDrumPad(color: Colors.red, B: 'ride'),
                  buildDrumPad(color: Colors.teal, B: 'clap'),
                  buildDrumPad(color: Colors.indigo, B: 'floor'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
