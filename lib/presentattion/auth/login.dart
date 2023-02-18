import 'package:auto_route/auto_route.dart';
// import 'package:elibrary/presentattion/auth/signup.dart';
import 'package:elibrary/presentattion/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../application/auth/auth_view_model.dart';

// import '../list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
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
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  controller: email),
              const SizedBox(height: 20),
              TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: password),
              const SizedBox(height: 30),
              model.isBusy
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        model.login(email: email.text, password: password.text);
                        //implement login logic
                      },
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to signup Page
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignupPage()));
                  AutoRouter.of(context).replace(const SignupRoute());
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
      ),
    );
  }
}
