import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/provider/users_provider.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    // TODO generalize username
    final fetchedUser = usersProvider.fetchUserData('user1');
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   Padding(
            //     padding: const EdgeInsets.only(
            //         top: 50, bottom: 20, left: 25, right: 25),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         CircleAvatar(
            //           radius: 60,
            //           backgroundImage: NetworkImage(fetchedUser.photoUrl),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Icon(
            //               Icons.group_add,
            //               color: Colors.white,
            //             ),
            //             SizedBox(
            //               width: 15,
            //             ),
            //             IconButton(
            //               icon: Icon(Icons.call_missed_outgoing),
            //               onPressed: () {
            //                 auth.logout();
            //                 setState(() {});
            //               },
            //             ),
            //             SizedBox(
            //               width: 15,
            //             ),
            //             Icon(
            //               Icons.more_horiz,
            //               color: Colors.white,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(left: 30.0),
            //     child: Text(auth.currentUser.name),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(left: 30.0),
            //     child: Text(auth.currentUser.id),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(left: 30.0),
            //     child: Text('Bio' + auth.currentUser.bio),
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Text(auth.currentUser.following.toString() + ' Following'),
            //       Text(auth.currentUser.fame.toString() + ' Fans'),
            //       Text(auth.currentUser.hearts.toString() + ' Hearts'),
            //     ],
            //   ),
            //   Expanded(
            //     flex: 1,
            //     child: Container(
            //       color: Colors.pink,
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Row(
            //                 children: [
            //                   Icon(Icons.videocam),
            //                   Text('  Videos  0'),
            //                 ],
            //               ),
            //               Container(
            //                 width: 0.5,
            //                 color: Colors.black,
            //                 height: 15,
            //               ),
            //               Row(
            //                 children: [
            //                   Icon(Icons.favorite_border),
            //                   Text('  Likes  0'),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           // VideoGrid(),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
