import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elibrary/domain/auth/i_auth_facade.dart';
import 'package:elibrary/domain/core/failures/general_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'models/user_model.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<GeneralFailure, String>> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = UserModel(
          accessLevel: 1,
          email: email,
          firstName: firstName,
          lastName: lastName,
          books: []);
      addUserToFireStore(user: user);
      return right(result.user!.uid);
    } on FirebaseAuthException catch (e) {
      return left(GeneralFailure.badRequest(e.message));
    }
  }

  addUserToFireStore({
    required UserModel user,
  }) async {
    var ref = await FirebaseFirestore.instance
        .collection("userData")
        .doc(user.email)
        .set(user.toMap());
    // .add(user.toMap());
    return ref;
  }

  @override
  Future<Either<GeneralFailure, String>> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      // addUserToFireStore(user: user);
      String accessLevel = await checkUserAccessLevel(email: email);
      log(accessLevel);
      return right(accessLevel);
    } on FirebaseAuthException catch (e) {
      return left(GeneralFailure.badRequest(e.message));
    }
  }

  Future<String> checkUserAccessLevel({required String email}) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('userData');
    final snapshot = await users.doc(email).get();
    final data = snapshot.data() as Map<String, dynamic>;
    return data['accessLevel'].toString();
  }
}
