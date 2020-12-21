import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future main() async {
  final item = await fetch();
  print(item.title);
}

Future<TodoItem> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var item = TodoItem.fromJson(json);
  return item;
}

class TodoItem {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  TodoItem({this.title, this.id, this.userId, this.completed});

  factory TodoItem.fromJson(Map json) {
    return TodoItem(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        completed: json['completed']);
  }
}
