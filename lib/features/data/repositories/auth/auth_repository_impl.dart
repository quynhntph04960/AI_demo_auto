import '../../../domain/entities/auth_contact.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../datasources/auth/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.localDataSource);

  final AuthLocalDataSource localDataSource;

  @override
  AuthContact getSavedContact() {
    return localDataSource.getSavedContact();
  }
}
