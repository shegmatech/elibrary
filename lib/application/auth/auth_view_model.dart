import 'package:elibrary/domain/auth/i_auth_facade.dart';
import 'package:elibrary/presentattion/routes/app_router.gr.dart';
import 'package:elibrary/presentattion/utils/util.dart';
import 'package:stacked/stacked.dart';

import '../../injection.dart';
// import '../../presentattion/routes/app_router.gr.dart';

class AuthViewModel extends BaseViewModel {
  final IAuthFacade _auth = getIt<IAuthFacade>();
  final AppRouter _appRouter = getIt<AppRouter>();
  void sinupUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    setBusy(true);
    final failureOrSuccessOption = await _auth.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    failureOrSuccessOption.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      showSuccessToast(r);
      _appRouter.replace(const LoginRoute());
    });
  }

  void login({required String email, required String password}) async {
    setBusy(true);
    final failureOrSuccessOption =
        await _auth.login(email: email, password: password);
    failureOrSuccessOption.fold((l) {
      setBusy(false);
      showErrorToast(l.message!);
    }, (r) {
      setBusy(false);
      showSuccessToast(r);
      if (r == "1") {
        _appRouter.replace(const UserHome());
      } else {
        _appRouter.replace(const AdminHome());
      }

      // _appRouter.replace(const LoginRoute());
    });
  }
}
