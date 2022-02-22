import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String data;
  HomePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            Text(data),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () {
            Navigator.of(context).pushNamed('/', arguments: '');
          },
        ),
      ),
    );
  }
}
