import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/authentication/authentication.dart';
import 'package:traffic_police/data/repository/all_repository.dart';
import 'package:traffic_police/exceptions/authException.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationRepository authenticationRepository;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationRepository authenticationRepository)
      : assert(authenticationBloc != null),
        assert(authenticationRepository != null),
        authenticationBloc = authenticationBloc,
        authenticationRepository = authenticationRepository,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();

    try {
      final user = await authenticationRepository.logIn(
          email: event.email, password: event.password);
      if (user != null) {
        authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        // yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Something very weird just happened');
      }
    } on AuthenticationException catch (e) {
      yield LoginFailure(error: e.message);
      print(e.message);
    } catch (err) {
      yield LoginFailure(error: err.toString());
      print(err.toString());
    }
  }
}
