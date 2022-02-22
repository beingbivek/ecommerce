import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final String? userId;
  final String? pass;

  Post({this.userId, this.pass});

  factory Post.fromJson(Map json) {
    return Post(
      userId: json['userId'],
      pass: json['pass'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["userId"] = userId;
    map["pass"] = pass;

    return map;
  }
}

Future createPost(String url, {Map? body}) async {
  return http.post(Uri(), body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class LoginPage extends StatelessWidget {
  final Future? post;
  const LoginPage({Key? key, this.post}) : super(key: key);
  static final createposturl =
      'https://ecommerceapi.rgbitsolution.com.np/api/login';
  static TextEditingController userController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var user, pass;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'to Ecommerce',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        // user = value;
                      },
                      onChanged: (value) {
                        user = value;
                      },
                    ),
                    TextFormField(
                      controller: passController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (value) {
                        pass = value;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        print(user);
                        try {
                          Post newPost = new Post(userId: user, pass: pass);
                          Post p = await createPost(createposturl,
                              body: newPost.toMap());
                          print(p.userId);
                        } catch (e) {
                          print(e);
                        }

                        // Navigator.of(context)
                        //     .pushNamed('/home', arguments: user);
                      },
                      color: Colors.amber,
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
