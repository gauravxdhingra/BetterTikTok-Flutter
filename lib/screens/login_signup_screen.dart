import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/SignUp.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text('LitSnap - Short Videos'),
          Text('Get Started'),
          // TODO: Google Facebook Instagram Email/Phone
        ],
      ),
    );
  }
}
