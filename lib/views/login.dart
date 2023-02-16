import 'package:elibrary/views/signup.dart';
import 'package:flutter/material.dart';

import 'list_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                //implement login logic
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListPage()));
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Navigate to signup Page
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupPage()));
              },
              child: const Text(
                'Not registered yet? Sign up now!',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
