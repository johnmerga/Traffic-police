import "dart:async";
import 'package:traffic_police/data/data_provider/data_provider.dart';
import 'package:traffic_police/data/models/models.dart';

enum AuthenticationStatus { unKnown, authenticated, unauthenticated }

class AuthenticationRepository {
  final AuthenticationDataProvider authenticationDataProvider;

  AuthenticationRepository({required this.authenticationDataProvider});

  Future<Officer> logIn({
required String email,
    required String password,
  }) async {
    return await authenticationDataProvider.signInWithEmailAndPassword(
        email, password);
  }

  // Future<bool> register({
  //    String? username,
  //    String? email,
  //    String? password,
  //   // ignore: non_constant_identifier_names
  //   @required String role_id
  // }) async {
  //   return await authenticationDataProvider.signUpWithEmailAndPassword(
  //       username, email, password, role_id);
  // }

  Future<Officer> getCurrentUser() async {
    return await authenticationDataProvider.getCurrentUser();
  }

  void logOut() {
    authenticationDataProvider.signOut();
  }
  
}
