import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String id;
  final String bio;
  final int following;
  final int fame;
  final int hearts;

  final String email;
  final String photoUrl;
  final String username;

  final bool private;

  User({
    this.name,
    this.id,
    this.bio,
    this.following,
    this.fame,
    this.hearts,
    this.private,
    this.email,
    this.photoUrl,
    this.username,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      // email: doc['email'],
      // username: doc['username'],
      // photoUrl: doc['photoUrl'],

      name: doc['name'],
      id: doc['id'],
      bio: doc['bio'],
      following: doc['following'],
      fame: doc['fame'],
      hearts: doc['hearts'],
      private: doc['private'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      username: doc['username'],
    );
  }
}
