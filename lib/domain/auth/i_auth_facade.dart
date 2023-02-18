import 'package:dartz/dartz.dart';
import 'package:elibrary/domain/core/failures/general_failure.dart';

abstract class IAuthFacade {
  Future<Either<GeneralFailure, String>> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});
}
