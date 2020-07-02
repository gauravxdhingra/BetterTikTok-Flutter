import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/SignUp.jpg',
            // 'assets/images/blurlogin.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40),
              child: Text(
                'LitSnap - Short Videos',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text('Get Started'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginOptions(
                  method: 'Facebook',
                  icon: BrandIcons.facebook,
                  action: () {},
                ),
                LoginOptions(
                  method: 'Instagram',
                  icon: BrandIcons.instagram,
                  action: () {},
                ),
                LoginOptions(
                  method: 'Google',
                  icon: BrandIcons.google,
                  action: () {},
                ),
                LoginOptions(
                  method: 'Phone/Email',
                  icon: Icons.mail,
                  action: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    Key key,
    this.method,
    this.icon,
    this.action,
  }) : super(key: key);

  final String method;
  final IconData icon;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: action,
            child: Column(
              children: [
                Icon(icon),
                Text(method),
              ],
            ),
          )
        ],
      ),
    );
  }
}
