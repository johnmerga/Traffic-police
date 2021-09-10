import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/officer/officer.dart';
import 'package:traffic_police/data/repository/officer_repository.dart';


class OfficerBloc extends Bloc<OfficerEvent, OfficerState> {
  final OfficerRepository officerRepository;

  OfficerBloc({required this.officerRepository}) : super(OfficerLoading());

  @override
  Stream<OfficerState> mapEventToState(OfficerEvent event) async* {
    if (event is OfficerLoad) {
      yield OfficerLoading();
      try {
        final officers = await officerRepository.fetchAll();
        yield OfficerOperationSuccess(officers);
      } catch (_) {
        yield OfficerOperationFailure();
      }
    }

    if (event is OfficerCreate) {
      try {
        await officerRepository.create(event.officer);
        final officers = await officerRepository.fetchAll();
        yield OfficerOperationSuccess(officers);
      } catch (_) {
        yield OfficerOperationFailure();
      }
    }

    if (event is OfficerUpdate) {
      try {
        await officerRepository.update(event.officer.id??"", event.officer);
        final officers = await officerRepository.fetchAll();
        yield OfficerOperationSuccess(officers);
      } catch (_) {
        yield OfficerOperationFailure();
      }
    }

    if (event is OfficerDelete) {
      try {
        await officerRepository.delete(event.id);
        final officers = await officerRepository.fetchAll();
        yield OfficerOperationSuccess(officers);
      } catch (_) {
        yield OfficerOperationFailure();
      }
    }
  }
}
