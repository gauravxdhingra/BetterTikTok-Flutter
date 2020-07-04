import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/models/user.dart';
import 'package:tiktok_alt/provider/users_provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    final usersDb = Provider.of<UsersProvider>(context);

    TextEditingController searchController = TextEditingController();

    buildSearchResults() {
      return FutureBuilder(
        future: usersDb.searchResultsFutureGet,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          // List<Text> searchResults = [];
          // snapshot.data.documents.forEach((doc) {
          //   User user = User.fromDocument(doc);
          //   searchResults.add(Text(user.username));
          // });
          List<UserResult> searchResults = [];
          snapshot.data.documents.forEach((doc) {
            User user = User.fromDocument(doc);
            UserResult searchResult = UserResult(user: user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        },
      );
    }

    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  // color: Colors.white,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isSearch = true;
                      });
                    },
                    maxLines: 1,
                    onFieldSubmitted: (String user) {
                      usersDb.handleSearch(user);
                    },
                  ),
                ),
              ),
              if (!isSearch) Text('Trending'),
              if (!isSearch) Text('Rising Stars'),
              if (!isSearch) Text('#Hashtags'),
              if (!isSearch) Text('Popular Sounds'),
              if (!isSearch) buildSearchResults(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  final User user;

  const UserResult({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Column(
        children: <Widget>[
          GestureDetector(
            // onTap: () => showProfile(context, profileId: user.id),
            child: ListTile(
              leading: CircleAvatar(
                // backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                backgroundColor: Colors.grey,
              ),
              title: Text(
                'user.displayName',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                user.username,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            height: 2,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
