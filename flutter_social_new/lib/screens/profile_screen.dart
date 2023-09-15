import 'package:flutter/material.dart';
import 'package:flutter_social_new/models/user_model.dart';
import 'package:flutter_social_new/widgets/custom_drawer.dart';
import 'package:flutter_social_new/widgets/posts_carousel.dart';
import 'package:flutter_social_new/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final PageController _yourPostsPageController;
  late final PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();

    _yourPostsPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    _favoritesPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _yourPostsPageController.dispose();
    _favoritesPageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    width: double.infinity,
                    height: 300.0,
                    image: AssetImage(widget.user.backgroundImageUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(Icons.menu),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        width: 120.0,
                        height: 120.0,
                        image: AssetImage(widget.user.profileImageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name ?? '',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Following',
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.following.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Followers',
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.followers.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
              title: 'Your posts',
              posts: widget.user.posts ?? [],
              pageController: _yourPostsPageController,
            ),
            PostsCarousel(
              title: 'Favorites',
              posts: widget.user.favorites ?? [],
              pageController: _favoritesPageController,
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
