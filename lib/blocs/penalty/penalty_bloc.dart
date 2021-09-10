import 'dart:async';
import 'package:traffic_police/blocs/penalty/penalty.dart';
import 'package:traffic_police/data/data_provider/data_provider.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/data/repository/penalty_repository.dart';
import 'package:bloc/bloc.dart';

class PenaltyBloc extends Bloc<PenaltyEvent, PenaltyState> {
  PenaltyBloc() : super(PenaltyInitial());
  final PenaltyRepository repository = PenaltyRepository(PenaltyDataProvider());
  @override
  Stream<PenaltyState> mapEventToState(
    PenaltyEvent event,
  ) async* {
    if (event is FetchPenaltyByOfficer) {
      yield* await _handlePenaltyFetch(event);
    } else if (event is DeletePenalty) {
      yield* await _handlePenaltyDelete(event);
    } else if (event is UpdatePenalty) {
      yield* await _handlePenaltyUpdate(event);
    } else if (event is CreatePenalty) {
      yield* await _handlePenaltyCreate(event);
    }
  }

  Stream<PenaltyState> _handlePenaltyFetch(FetchPenaltyByOfficer event) async* {
    try {
      yield PenaltyLoadingState();
      final penalties = await repository.fetchOfficerPenalties();
      yield PenaltyListLoadedState(panalties: penalties);
    } catch (e) {
      yield PenaltyErrorState(message: e.toString());
    }
  }

  Stream<PenaltyState> _handlePenaltyCreate(CreatePenalty event) async* {
    try {
      Penalty penalty = await repository.create(event.penalty);
      final _state = (state as PenaltyListLoadedState);
      _state.panalties.add(penalty);
      yield PenaltyLoadingState();
      yield PenaltyListLoadedState(panalties: _state.panalties);
    } catch (e) {
      yield PenaltyErrorState(message: e.toString());
    }
  }

  Stream<PenaltyState> _handlePenaltyUpdate(UpdatePenalty event) async* {
    try {
      await repository.update(event.penalty);
      final _state = (state as PenaltyListLoadedState);
      final index = _state.panalties
          .indexWhere((element) => element.id == event.penalty.id);
      _state.panalties[index] = event.penalty;
      yield PenaltyLoadingState();
      yield PenaltyListLoadedState(panalties: _state.panalties);
    } catch (e) {
      yield PenaltyErrorState(message: e.toString());
    }
  }

  Stream<PenaltyState> _handlePenaltyDelete(DeletePenalty event) async* {
    try {
      await repository.delete(event.penalty.id);
      final _state = (state as PenaltyListLoadedState);
      _state.panalties.removeWhere((element) => element.id == event.penalty.id);
      yield PenaltyLoadingState();
      yield PenaltyListLoadedState(panalties: _state.panalties);
    } catch (e) {
      yield PenaltyErrorState(message: e.toString());
    }
  }
}
