import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:tiktok_alt/screens/home_pageview.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              Stack(
                children: [
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 1 / 4,
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: FlatButton(
                  child: Text('Skip Login'),
                  onPressed: () {
                    Navigator.pushNamed(context, HomepageView.routename);
                  },
                ),
              ),
            ],
          ),
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
    return GestureDetector(
      onTap: action,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Text(method),
          ],
        ),
      ),
    );
  }
}
