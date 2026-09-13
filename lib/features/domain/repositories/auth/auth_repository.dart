import '../../entities/auth_contact.dart';

abstract class AuthRepository {
  AuthContact getSavedContact();
}
