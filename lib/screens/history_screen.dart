import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/home_button.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButton(
                onTap: () {},
                text: 'New Meeting',
                icon: Icons.videocam,
              ),
              HomeButton(
                onTap: () {},
                text: 'Join Meeting',
                icon: Icons.add_box_rounded,
              ),
              HomeButton(
                onTap: () {},
                text: 'Schedule',
                icon: Icons.calendar_today,
              ),
              HomeButton(
                onTap: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward,
              ),
            ],
          ),
          const Expanded(
              child: Center(
                child: Text(
            'Create/Join a meeting.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
            ),
          ),
              ))
        ],
      );
  }
}