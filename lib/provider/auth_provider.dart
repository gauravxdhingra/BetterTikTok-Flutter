import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok_alt/models/user.dart';

class AuthProvider with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final usersRef = Firestore.instance.collection('users');
  User currentUser;
  bool isAuth = false;

  googleSuppresedSignIn() async {
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        handleSignIn(account);
      },
      onError: (err) {
        print('Error signing in: $err');
      },
    );
    googleSignIn
        .signInSilently(
      suppressErrors: false,
    )
        .then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('SilentSignInError $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) async {
    if (account != null) {
      // print('$account');
      await createUserInFirestore();
      isAuth = true;
      notifyListeners();
      // setState(() {
      //   isAuth = true;
      // });
    } else {
      // setState(() {
      //   isAuth = false;
      // });
      isAuth = false;
      notifyListeners();
    }
  }

  login() {
    googleSignIn.signIn();
    isAuth = true;
    notifyListeners();
  }

  logout() {
    googleSignIn.signOut();
  }

  createUserInFirestore() async {
    // check if user exists in users collection in database(acc to their id)
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.document(user.email).get();
    // DocumentSnapshot doc = await usersRef.document(user.id).get();
    if (!doc.exists) {
      await usersRef.document(user.email).setData({
        'name': user.displayName,
        'id': user.id,
        'bio': '',
        'following': 0,
        'fame': 0,
        'hearts': 0,
        'private': false,
        'email': user.email,
        'photoUrl': user.photoUrl,
        // TODO: Username input
        'username': 'Username',
      });
      doc = await usersRef.document(user.email).get();
    }
    currentUser = User.fromDocument(doc);
    // print(currentUser);
    // setState(() {
    //   isAuth = true;
    // });
    isAuth = true;
    notifyListeners();
    // print(currentUser.username);
  }
}
