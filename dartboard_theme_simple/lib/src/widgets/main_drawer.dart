import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../about_page.dart';
import '../blog_page.dart';
import '../contact_page.dart';
import '../docs_page.dart';
import '../home_page.dart';
import '../privacy_policy_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text("Tatsuhiko Arai"),
            accountEmail: Text("tatsu@tatsu.com"),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 42.0),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.folderOpen),
            title: Text('Docs'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
              Navigator.pushNamed(context, DocsPage.route);
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.blog),
            title: Text('Blog'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
              Navigator.pushNamed(context, BlogPage.route);
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.addressCard),
            title: Text('About'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
              Navigator.pushNamed(context, AboutPage.route);
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.envelope),
            title: Text('Contact'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
              Navigator.pushNamed(context, ContactPage.route);
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userShield),
            title: Text('Privacy Policy'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(HomePage.route));
              Navigator.pushNamed(context, PrivacyPolicyPage.route);
            },
          ),
        ],
      ),
    );
  }
}
