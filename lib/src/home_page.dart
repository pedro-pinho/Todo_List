import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List Todo\'s')),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, int index) {
            return ListTile(title: Text('aaa $index'));
          },
        ));
  }
}
