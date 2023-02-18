import 'package:elibrary/presentattion/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  addBook({required String title, required String content}) async {
    setBusy(true);
    final failureOrSuccess =
        await bookService.addBooK(title: title, content: content);
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
            (element) => element.author == user?.uid,
          )
          .toList();
      notifyListeners();
    });
  }
}
