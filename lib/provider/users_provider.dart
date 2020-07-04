import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok_alt/models/user.dart';

class UsersProvider with ChangeNotifier {
  final usersRef = Firestore.instance.collection('users');
// Search, Fans, Following, Hearts

  searchUser(String searchUser) {}

  TextEditingController searchController = TextEditingController();

  Future<QuerySnapshot> searchResultsFuture;

  handleSearch(String query) {
    Future<QuerySnapshot> users = usersRef
        .where('displayName', isGreaterThanOrEqualTo: query)
        .getDocuments();
    // setState(() {
    searchResultsFuture = users;
    // });
    notifyListeners();
  }

  Future<QuerySnapshot> get searchResultsFutureGet {
    return searchResultsFuture;
  }

  Future<User> fetchUserData(String username) async {
    // check if user exists in users collection in database(acc to their id)
    // final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.document(username).get();
    // DocumentSnapshot doc = await usersRef.document(user.id).get();

    User fetchedUser = User.fromDocument(doc);
    return fetchedUser;
  }
}
