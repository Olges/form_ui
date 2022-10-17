import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                )), // background
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'WELCOME!!',
                    style: TextStyle(fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Login()
              ],
            )), // WELCOME + Login
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: 'Username / Email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              onPressed: () {},
              child: const Text('Sign In'),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account?"),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purple
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerPage');
                    },
                    child: const Text('Register'))
              ],
            ),
          )
        ],
      ),
    );
  }
}