import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/modals/user.dart';
import 'package:ecommerce/service/networking.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController passconController = TextEditingController();

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
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        // user = value;
                      },
                      onChanged: (value) {
                        user = value;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
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
                      validator: (value) {
                        // user = value;
                      },
                      onChanged: (value) {
                        user = value;
                      },
                    ),
                    TextFormField(
                      controller: passconController,
                      decoration:
                          InputDecoration(labelText: 'Confirmation Password'),
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
                          User newUser = new User(
                              name: nameController.text,
                              email: user,
                              password: passController.text,
                              passwordconfirmation: pass);
                          User p = await (postUser(
                              ecommerceApi + "registration/",
                              body: newUser.toMap()));
                          print(p.toString());
                        } catch (e) {
                          print(e);
                        }

                        // Navigator.of(context)
                        //     .pushNamed('/home', arguments: user);
                      },
                      color: Colors.amber,
                      child: Text('SignUp'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text("Already had account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/signup', arguments: null);
                          },
                          child: Text('Login'),
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
