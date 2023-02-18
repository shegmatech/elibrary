import 'package:dartz/dartz.dart';
import 'package:elibrary/domain/auth/i_auth_facade.dart';
import 'package:elibrary/domain/core/failures/general_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

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
      return right(result.user!.uid);
    } on FirebaseAuthException catch (e) {
      return left( GeneralFailure.badRequest(e.message));
    }
  }
}
