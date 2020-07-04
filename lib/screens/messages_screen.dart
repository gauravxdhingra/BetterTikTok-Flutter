import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text('Notifications'),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.white,
              ),
              title: Text(
                'Direct Message',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'user1, user2, user3',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.35),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                radius: 15,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              title: Text(
                'Follow requests',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'user1, user2, user3',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.35),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                radius: 15,
              ),
              onTap: () {},
            ),
            Divider(color: Colors.white30),
            Text('No Notifications'),
          ],
        ),
      ),
    );
  }
}
