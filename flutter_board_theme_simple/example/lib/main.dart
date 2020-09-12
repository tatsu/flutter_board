import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    routeGenerator.builderSettingsMap = {
      '/': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: PageArguments(
            title: 'Home',
            icon: FaIcon(FontAwesomeIcons.home),
          )),
      '/docs': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          subBuilder: (context) => ContentPage(isSubPage: true),
          arguments: PageArguments(
            title: 'Documents',
            icon: FaIcon(FontAwesomeIcons.folderOpen),
          )),
      '/blog': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: PageArguments(
            title: 'Blog',
            icon: FaIcon(FontAwesomeIcons.blog),
          )),
      '/about': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: PageArguments(
            title: 'About',
            icon: FaIcon(FontAwesomeIcons.addressCard),
          )),
      '/contact': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: PageArguments(
            title: 'Contact',
            icon: FaIcon(FontAwesomeIcons.envelope),
          )),
      '/privacy_policy': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: PageArguments(
            title: 'Privacy Policy',
            icon: FaIcon(FontAwesomeIcons.userShield),
          )),
    };
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: routeGenerator,
      onGenerateInitialRoutes: (String initialRouteName) {
        return <Route>[
          routeGenerator(RouteSettings(
              name: initialRouteName,
              arguments: routeGenerator
                  .builderSettingsMap[initialRouteName]?.arguments))
        ];
      },
      title: 'Flutter Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
