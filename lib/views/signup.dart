import 'package:elibrary/views/list_page.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'First Name',
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
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Last Name',
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
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email Address',
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
            SizedBox(height: 20),
            TextField(
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implement sign-up logic
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListPage()));
              },
              child: Text('Sign up'),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                // Navigate to signup Page
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: const Text(
                'Already have an Account? Sign in here!',
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
