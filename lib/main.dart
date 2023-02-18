import 'package:elibrary/injection.dart';
import 'package:elibrary/presentattion/core/app_widget.dart';
import 'package:flutter/material.dart';
// import 'package:elibrary/presentattion/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
