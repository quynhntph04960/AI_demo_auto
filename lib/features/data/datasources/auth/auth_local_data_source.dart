import '../../models/auth/auth_contact_model.dart';

abstract class AuthLocalDataSource {
  AuthContactModel getSavedContact();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl();

  @override
  AuthContactModel getSavedContact() {
    return const AuthContactModel(phoneNumber: '+84 899545356');
  }
}
