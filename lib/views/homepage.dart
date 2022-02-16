import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String data;
  HomePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(data),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.of(context).pushNamed('/', arguments: '');
          },
        ),
      ),
    );
  }
}
