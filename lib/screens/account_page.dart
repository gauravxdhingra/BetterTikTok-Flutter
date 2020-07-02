import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 20, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.group_add,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.more_horiz,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Name'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('ID: 123456789'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Bio'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('0 Following'),
              Text('0 Fans'),
              Text('0 Hearts'),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.pink,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.videocam),
                          Text('  Videos  0'),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        color: Colors.black,
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite_border),
                          Text('  Likes  0'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
