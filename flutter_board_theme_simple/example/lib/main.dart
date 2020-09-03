import 'package:flutter/material.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              title: 'Home',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.home),
                title: Text('Home'),
              ),
            ),
        '/docs': (context) => DocsPage(
              title: 'Documents',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.folderOpen),
                title: Text('Docs'),
              ),
            ),
        '/blog': (context) => BlogPage(
              title: 'Blog',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.blog),
                title: Text('Blog'),
              ),
            ),
        '/about': (context) => AboutPage(
              title: 'About',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.addressCard),
                title: Text('About'),
              ),
            ),
        '/contact': (context) => ContactPage(
              title: 'Contact',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.envelope),
                title: Text('Contact'),
              ),
            ),
        'privacy_policy': (context) => PrivacyPolicyPage(
              title: 'Privacy Policy',
              menuItem: ListTile(
                leading: FaIcon(FontAwesomeIcons.userShield),
                title: Text('Privacy Policy'),
              ),
            ),
      },
      title: 'Flutter Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
