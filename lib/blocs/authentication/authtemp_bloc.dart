import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/data/repository/all_repository.dart';
import 'auth_temp.dart';

class AuthtempBloc extends Bloc<AuthtempEvent, AuthtempState> {
  AuthtempBloc({required this.repository}) : super(AuthtempInitial());
  final AuthenticationRepository repository;
  @override
  Stream<AuthtempState> mapEventToState(AuthtempEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      await Future.delayed(Duration(seconds: 2));
      // await Duration(microseconds: 2);
      try {
        final Officer officer = await repository.logIn(
            email: event.email, password: event.password);
        yield LoggedIn(user: officer);
      } catch (e) {
        print(e);
        yield LoginFailed(error: e.toString());
      }
    } else if (event is LogoutEvent) {
      await Future.delayed(Duration(seconds: 2));
      repository.logOut();
    }
  }
}
