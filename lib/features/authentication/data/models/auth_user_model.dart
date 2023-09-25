import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:rick_morty_universe/features/authentication/domain/entities/auth_user.dart';

class AuthUserModel {
  final String id;
  final String email;

  AuthUserModel({required this.id, required this.email});

  factory AuthUserModel.firebaseAuthUser(firebase_auth.User firebaseUser) {
    return AuthUserModel(id: firebaseUser.uid, email: firebaseUser.email!);
  }

  AuthUser toEntity() {
    return AuthUser(id: id, email: email);
  }
}
