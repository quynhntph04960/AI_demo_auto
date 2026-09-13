import '../../entities/auth_contact.dart';
import '../../repositories/auth/auth_repository.dart';

class GetSavedAuthContact {
  const GetSavedAuthContact(this.repository);

  final AuthRepository repository;

  AuthContact call() {
    return repository.getSavedContact();
  }
}
