import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../infrastructure/auth/models/book_model.dart';
import '../core/failures/general_failure.dart';

abstract class BookService {
  Future<Either<GeneralFailure, String>> addBooK(
      {required String title, required String content, required String author,required String imgUrl});
  Future<Either<GeneralFailure, List<BookModel>>> fetchBooks();
  Future<Either<GeneralFailure, String>> requestBook(
      {required String bbookTilte});
  Future<Either<GeneralFailure, String>> accepRequest(
      {required String bbookTilte});
  Future<Either<GeneralFailure, String>> uploadBookCover({required File file,required String bookTitle});
}
