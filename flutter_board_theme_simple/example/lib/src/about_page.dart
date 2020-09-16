import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    final TextStyle titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.red[400],
    );
    final TextStyle textStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[700],
    );

    final arguments =
        ModalRoute.of(context).settings.arguments as MenuPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      drawer: ContentDrawer(),
      body: Container(
        width: sizeX,
        padding: EdgeInsets.all(sizeX / 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage('content/images/avatar.png'),
                  radius: 48),
              SizedBox(height: 16),
              Text('Tatsuhiko Arai', style: titleStyle),
              SizedBox(height: 16),
              Text('Flutter App Developer', style: textStyle),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                        'content/images/Twitter_Social_Icon_Circle_Color.png',
                        width: 32),
                    onPressed: () async {
                      await _launchURL('https://twitter.com/tatarai');
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'content/images/GitHub-Mark-64px.png',
                      width: 32,
                    ),
                    onPressed: () async {
                      await _launchURL('https://github.com/tatsu');
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'content/images/f_logo_RGB-Blue_72.png',
                      width: 32,
                    ),
                    onPressed: () async {
                      await _launchURL('https://www.facebook.com/tatarai');
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'content/images/LI-In-Bug.png',
                      width: 32,
                    ),
                    onPressed: () async {
                      await _launchURL('https://www.linkedin.com/in/tatarai/');
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey[500]),
              SizedBox(height: 16),
              Text('An old padawan programmer,\nlearning to be a master.',
                  style: textStyle),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
