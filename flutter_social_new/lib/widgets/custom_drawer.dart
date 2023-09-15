import 'package:flutter/material.dart';
import 'package:flutter_social_new/screens/profile_screen.dart';

import '../data/data.dart';
import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                width: double.infinity,
                height: 200.0,
                image: AssetImage(currentUser.backgroundImageUrl ?? ''),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      width: 100.0,
                      height: 100.0,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      currentUser.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            // () => Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomeScreen()),
            // ),
            () => Navigator.pop(context),
          ),
          _buildDrawerOption(const Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(const Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your profile',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(user: currentUser),
              ),
            ),
          ),
          _buildDrawerOption(const Icon(Icons.settings), 'Settings', () {}),
          const Spacer(),
          _buildDrawerOption(
            const Icon(Icons.directions_run),
            'Logout',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          ),
          // Expanded(
          //   child: Align(
          //     alignment: FractionalOffset.bottomCenter,
          //     child: _buildDrawerOption(
          //       const Icon(Icons.directions_run),
          //       'Logout',
          //       () => Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => const LoginScreen()),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDrawerOption(Icon icon, String title, Function()? onTap) {
    return ListTile(
      leading: icon,
      title: Text(title, style: const TextStyle(fontSize: 20.0)),
      onTap: onTap,
    );
  }
}
