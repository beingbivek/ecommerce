import 'dart:ffi';

import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/modals/user.dart';
import 'package:ecommerce/service/networking.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Future? post;
  const LoginPage({Key? key, this.post}) : super(key: key);
  static final createuser = 'https://ecommerceapi.rgbitsolution.com.np/api/';
  static TextEditingController userController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    String user, pass;

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
                      decoration: InputDecoration(labelText: 'Email'),
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
                        print(userController.text);
                        try {
                          User newUser = new User(
                              email: userController.text,
                              password: passController.text);
                          // await postUser(ecommerceApi + "login",
                          //     body: newUser.toMap());
                          User p = await (postUser(ecommerceApi + "login",
                              body: newUser.toMap()));
                          print(p.toString());
                        } catch (e) {
                          print(e);
                        }

                        // Navigator.of(context)
                        //     .pushNamed('/home', arguments: user);
                      },
                      color: Colors.amber,
                      child: Text('Login'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text("Don't have account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/', arguments: null);
                          },
                          child: Text('Sign Up'),
                        )
                      ],
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
