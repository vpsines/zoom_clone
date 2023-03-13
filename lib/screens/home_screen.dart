import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/history_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  List<Widget> pages = [
    const HistoryScreen(),
  ];

  void onPageChange(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text('Meet and Chat'),
        elevation: 0,
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        currentIndex: currentPage,
        onTap: onPageChange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet and Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet and Chat',
          ),
        ],
      ),
    );
  }
}
