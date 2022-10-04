import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo\'s'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
          ListTile(title: Text('Title')),
        ],
      ),
    );
  }
}
