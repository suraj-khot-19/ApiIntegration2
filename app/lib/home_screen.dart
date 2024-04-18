import 'dart:convert';

import 'package:app/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //named list
  List<CommentModel> comList = [];
  //future fun
  Future<List<CommentModel>> getComment() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        comList.add(CommentModel.fromJson(i));
      }
      return comList;
    } else {
      return comList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Integration"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
