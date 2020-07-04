import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok_alt/models/user.dart';

class NotificationsProvider with ChangeNotifier {
//   final usersRef = Firestore.instance.collection('users');
// // Search, Fans, Following, Hearts

//   searchUser(String searchUser) {}

//   TextEditingController searchController = TextEditingController();

//   Future<QuerySnapshot> searchResultsFuture;

//   handleSearch(String query) {
//     Future<QuerySnapshot> users = usersRef
//         .where('displayName', isGreaterThanOrEqualTo: query)
//         .getDocuments();
//     // setState(() {
//     searchResultsFuture = users;
//     // });
//     notifyListeners();
//   }

//   Future<QuerySnapshot> get searchResultsFutureGet {
//     return searchResultsFuture;
//   }

//   // createUserInFirestore() async {
//   //   // check if user exists in users collection in database(acc to their id)
//   //   final GoogleSignInAccount user = googleSignIn.currentUser;
//   //   DocumentSnapshot doc = await usersRef.document(user.email).get();
//   //   // DocumentSnapshot doc = await usersRef.document(user.id).get();
//   //   if (!doc.exists) {
//   //     await usersRef.document(user.email).setData({
//   //       'name': user.displayName,
//   //       'id': user.id,
//   //       'bio': '',
//   //       'following': 0,
//   //       'fame': 0,
//   //       'hearts': 0,
//   //       'private': false,
//   //       'email': user.email,
//   //       'photoUrl': user.photoUrl,
//   //       // TODO: Username input
//   //       'username': 'Username',
//   //     });
//   //     doc = await usersRef.document(user.email).get();
//   //   }
//   //   currentUser = User.fromDocument(doc);
//   //   // print(currentUser);
//   //   // setState(() {
//   //   //   isAuth = true;
//   //   // });
//   //   isAuth = true;
//   //   notifyListeners();
//   //   // print(currentUser.username);
//   // }
}
