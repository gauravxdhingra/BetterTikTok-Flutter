import 'package:flutter/material.dart';
import 'package:tiktok_alt/screens/home_video_scroll_page.dart';
import 'package:tiktok_alt/screens/messages_screen.dart';
import 'package:tiktok_alt/screens/search_screen.dart';

import 'account_page.dart';
import 'home.dart';

class HomepageView extends StatefulWidget {
  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: PageView(
        children: [
          Home(),
          SearchScreen(),
          MessagesScreen(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.pink,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.textsms), title: Text('Messages')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account')),
        ],
      ),
    );
  }
}
