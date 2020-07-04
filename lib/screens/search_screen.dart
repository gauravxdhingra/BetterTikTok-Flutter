import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  // color: Colors.white,
                  child: Center(child: Text('Search')),
                ),
              ),
              Text('Trending'),
              Text('Rising Stars'),
              Text('#Hashtags'),
              Text('Popular Sounds'),
            ],
          ),
        ),
      ),
    );
  }
}
