import 'package:dartz/dartz.dart';

import '../../infrastructure/auth/models/book_model.dart';
import '../core/failures/general_failure.dart';

abstract class BookService {
  Future<Either<GeneralFailure, String>> addBooK(
      {required String title, required String content});
  Future<Either<GeneralFailure, List<BookModel>>> fetchBooks();
}
