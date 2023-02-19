import 'dart:io';

import 'package:elibrary/presentattion/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import '../../domain/book/book_serivce.dart';
import '../../infrastructure/auth/models/book_model.dart';
import '../../injection.dart';
import '../../presentattion/routes/app_router.gr.dart';

class HomeViewModel extends BaseViewModel {
  final BookService bookService = getIt<BookService>();
  final AppRouter appRouter = getIt<AppRouter>();

  List<BookModel> bookList = [];
  List<BookModel> filteredBooList = [];
  bool isImageSelected = false;

  addBook(
      {required String title,
      required String content,
      required File bookCover,
      required String author}) async {
    setBusy(true);
    // var file = File(bookCover);
    final result = await uploadBookCover(file: bookCover, title: title);

    final failureOrSuccess = await bookService.addBooK(
        imgUrl: result, title: title, content: content, author: author);
    failureOrSuccess.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) async {
      setBusy(false);
      showSuccessToast(r);

      await fetchBooksForAdmin();
      appRouter.push(const AdminHome());
    });
  }

  fetchBooksForAdmin() async {
    setBusy(true);
    final failureOrSuccess = await bookService.fetchBooks();
    failureOrSuccess.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      bookList = r;
      User? user = FirebaseAuth.instance.currentUser;
      filteredBooList = bookList
          .where(
            (element) => element.admin == user?.uid,
          )
          .toList();
      notifyListeners();
    });
  }

  fetchForUser() async {
    setBusy(true);
    final failureOrSuccess = await bookService.fetchBooks();
    failureOrSuccess.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      bookList = r;
      // User? user = FirebaseAuth.instance.currentUser;

      notifyListeners();
    });
  }

  requestBook({required String bookTitle}) async {
    setBusy(true);
    final failureOrSuccess =
        await bookService.requestBook(bbookTilte: bookTitle);
    failureOrSuccess.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      showSuccessToast(r);
      appRouter.replace(const UserHome());
    });
  }

  acceptRequest({required String bookTitle}) async {
    setBusy(true);
    final failureOrSuccess =
        await bookService.accepRequest(bbookTilte: bookTitle);
    failureOrSuccess.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      showSuccessToast(r);
      appRouter.replace(const AdminHome());
    });
  }

  Future<String> uploadBookCover(
      {required File file, required String title}) async {
    final failureOrSuccess =
        await bookService.uploadBookCover(file: file, bookTitle: title);
    return failureOrSuccess.fold((l) {
      showErrorToast(l.message!);
      return "";
    }, (r) {
      return r;
    });
  }

  Future<File> selextImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 45);
    return File(pickedImage!.path);
  }
}
