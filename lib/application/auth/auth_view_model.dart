import 'package:elibrary/domain/auth/i_auth_facade.dart';
import 'package:elibrary/presentattion/utils/util.dart';
import 'package:stacked/stacked.dart';

import '../../injection.dart';

class AuthViewModel extends BaseViewModel {
  final IAuthFacade _auth = getIt<IAuthFacade>();

  void sinupUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    final failureOrSuccessOption = await _auth.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    failureOrSuccessOption.fold((l) {
      // showErrorToast(l.message!);
    }, (r) {
      // showSuccessToast(r);
    });
  }
}
