import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/provider/auth_provider.dart';
import 'package:tiktok_alt/widgets/bottom_navbar.dart';

import 'account_page.dart';
import 'home.dart';
import 'login_signup_screen.dart';
import 'messages_screen.dart';
import 'search_screen.dart';

class HomepageView extends StatefulWidget {
  static const routename = 'homepageview';

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        children: [
          // LoginSignup(),
          Home(),
          SearchScreen(),
          MessagesScreen(),
          AccountPage(),
        ],
      ),
      bottomSheet: BottomNavBarHome(),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.pink,
      //   backgroundColor: Colors.black,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
      //     BottomNavigationBarItem(icon: Icon(Icons.textsms), title: Text('')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle), title: Text(''))
      //   ],
      // ),
    );
  }
}
