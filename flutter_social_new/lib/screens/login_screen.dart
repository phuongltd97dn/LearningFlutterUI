import 'package:flutter/material.dart';

import '../widgets/curve_clipper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Image(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.5,
                      image: const AssetImage(
                        'assets/images/login_background.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'FRENZY',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        prefixIcon: Icon(Icons.account_box, size: 30.0),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        prefixIcon: Icon(Icons.lock, size: 30.0),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          color: Theme.of(context).primaryColor,
                          height: 80.0,
                          child: const Text(
                            'Don\'t have an ccount? Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
