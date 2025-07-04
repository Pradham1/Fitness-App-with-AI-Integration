

import 'package:workout_app/services/auth/auth_provider.dart';
import 'package:workout_app/services/auth/auth_user.dart';
import 'package:workout_app/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  
  final AuthProvider provider;
  AuthService._(this.provider);

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();


  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendPasswordReset(toEmail: toEmail);
}