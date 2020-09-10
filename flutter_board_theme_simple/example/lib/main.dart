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
          (context) => ContentPage(),
          PageArguments(
            title: 'Home',
            icon: FaIcon(FontAwesomeIcons.home),
          )),
      '/docs': RouteBuilderSettings(
          (context) => ContentPage(),
          PageArguments(
            title: 'Documents',
            icon: FaIcon(FontAwesomeIcons.folderOpen),
          )),
      '/blog': RouteBuilderSettings(
          (context) => ContentPage(),
          PageArguments(
            title: 'Blog',
            icon: FaIcon(FontAwesomeIcons.blog),
          )),
      '/about': RouteBuilderSettings(
          (context) => ContentPage(),
          PageArguments(
            title: 'About',
            icon: FaIcon(FontAwesomeIcons.addressCard),
          )),
      '/contact': RouteBuilderSettings(
          (context) => ContentPage(),
          PageArguments(
            title: 'Contact',
            icon: FaIcon(FontAwesomeIcons.envelope),
          )),
      '/privacy_policy': RouteBuilderSettings(
          (context) => ContentPage(),
          PageArguments(
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
