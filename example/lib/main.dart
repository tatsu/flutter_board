import 'package:dartboard_theme_simple/dartboard_theme_simple.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(title: 'Home'),
        DocsPage.route: (context) => DocsPage(title: 'Documents'),
        BlogPage.route: (context) => BlogPage(title: 'Blog'),
        AboutPage.route: (context) => AboutPage(title: 'About'),
        ContactPage.route: (context) => ContactPage(title: 'Contact'),
        PrivacyPolicyPage.route: (context) =>
            PrivacyPolicyPage(title: 'Privacy Policy'),
      },
      title: 'Dartboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
