import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        var item = controller.todos[index];
        return ListTile(
            leading: Checkbox(
              value: item.completed,
              onChanged: (newValue) {
                setState(() {
                  item.completed = newValue;
                });
              }, //  <-- leading Checkbox
            ),
            title: Text(item.title));
      },
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  _error() {
    return Center(
        child: RaisedButton(
            onPressed: () {
              controller.start();
            },
            child: Text('Try again')));
  }

  stateManagement(HomeState state) {
    var result = _start();
    switch (state) {
      case HomeState.loading:
        result = _loading();
        break;
      case HomeState.error:
        result = _error();
        break;
      case HomeState.success:
        result = _success();
        break;
      default:
        result = _start();
        break;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Todo\'s'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh_outlined),
                onPressed: () {
                  controller.start();
                })
          ],
        ),
        body: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            }));
  }
}
