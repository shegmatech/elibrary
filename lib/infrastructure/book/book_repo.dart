import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/domain/core/failures/general_failure.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/book/book_serivce.dart';
import '../auth/models/book_model.dart';

@LazySingleton(as: BookService)
class BookRepo implements BookService {
  @override
  Future<Either<GeneralFailure, String>> addBooK(
      {required String title, required String content}) async {
    try {
      //  var ref = await FirebaseFirestore.instance
      //       .collection("userData")
      //       .doc(user.email)
      //       .set(user.toMap());

      final User? user = FirebaseAuth.instance.currentUser;
      var book = BookModel(
          title: title,
          content: content,
          author: user?.uid ?? "",
          isRequested: false,
          price: "0.0");
      await FirebaseFirestore.instance
          .collection("books")
          .doc(title)
          .set(book.toMap());
      return right("Success");
    } on FirebaseException catch (e) {
      return left(GeneralFailure.badRequest(e.message));
    }
  }

  @override
  Future<Either<GeneralFailure, List<BookModel>>> fetchBooks() async {
    try {
      QuerySnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('books').get();
      // contactList = documentSnapshot.data()['contacts'];
      List<DocumentSnapshot> docs = documentSnapshot.docs;
      List<BookModel> bookList = List.from(
          docs.map((e) => BookModel.fromMap(e.data() as Map<String, dynamic>)));
      return right(bookList);
    } on FirebaseAuthException catch (e) {
      return left(GeneralFailure.badRequest(e.message));
    }
  }
}
