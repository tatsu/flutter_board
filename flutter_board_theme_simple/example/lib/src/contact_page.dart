import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String name = '', email = '', message = '';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as MenuPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      drawer: ContentDrawer(),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ...[
                  Text(
                      'Please send your message to me. I will reply as soon as possible!'),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Name',
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Message',
                    ),
                    maxLines: 3,
                    onChanged: (value) {
                      message = value;
                    },
                  ),
                  FlatButton(
                    child: Text('Send'),
                    onPressed: () async {
                      _showDialog("Oops! I'm sorry...");
                    },
                  ),
                ].expand(
                  (widget) => [
                    widget,
                    SizedBox(
                      height: 24,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    name = email = message = '';
    super.initState();
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: [
          FlatButton(
            child: Text("That's OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
