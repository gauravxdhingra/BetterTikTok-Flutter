import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/provider/auth_provider.dart';
import 'package:tiktok_alt/screens/home_pageview.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LitSnap',
                      style: TextStyle(fontSize: 70),
                    ),
                    Text(
                      'Short Videos',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 1 / 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
                            action: () async {
                              await auth.googleSuppresedSignIn();
                              auth.login();
                            },
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
                right: 0,
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
    return Column(
      children: [
        GestureDetector(
          onTap: action,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),

            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            // margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(width: 20),
                Text(method, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
