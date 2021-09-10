import 'dart:async';
import 'package:traffic_police/models/models.dart';
import 'package:traffic_police/penalty/repository/penalty_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'penalty_event.dart';
part 'penalty_state.dart';

class PenaltyBloc extends Bloc<PenaltyEvent, PenaltyState> {
  PenaltyBloc({required this.repository}) : super(PenaltyInitial());
  final PenaltyRepository repository;
  @override
  Stream<PenaltyState> mapEventToState(
    PenaltyEvent event,
  ) async* {
    if (event is FetchPenalty){
      yield await _handlePenaltyFetch(event);
    } else if (event is CreatePenalty){
      yield await _handlePenaltyCreate(event);
    } else if (event is DeletePenalty){ 
      yield await _handlePenaltyDelete(event);
    } else if (event is UpdatePenalty){
      yield await _handlePenaltyUpdate(event);
    }
    }
    Future<PenaltyState> _handlePenaltyFetch(FetchPenalty event) async{
      try {
        final penalties = await repository.fetchAll(event.id);
        return PenaltyOperationSuccess(penalties: penalties);
      }catch (e){
        return PenaltyOperationFailure(errMsg: e.toString());
      }
      
    }
    Future<PenaltyState> _handlePenaltyCreate (CreatePenalty event)async{
      try {
        await repository.create(event.penalty);
        final penalties = await repository.fetchAll(event.penalty.officerId);
        return PenaltyOperationSuccess(penalties: penalties);
      }catch (e){
        return PenaltyOperationFailure(errMsg: e.toString());
      }
    
    }
    Future<PenaltyState> _handlePenaltyUpdate (UpdatePenalty event)async{
      try {
        await repository.update(event.penalty);
        final penalties = await repository.fetchAll(event.penalty.officerId);
        return PenaltyOperationSuccess(penalties: penalties);
      }catch (e){
        return PenaltyOperationFailure(errMsg: e.toString());
      }
    
    }
    Future<PenaltyState> _handlePenaltyDelete (DeletePenalty event)async{
      try {
        await repository.delete(event.penalty.id);
        final penalties = await repository.fetchAll(event.penalty.officerId);
        return PenaltyOperationSuccess(penalties: penalties);
      }catch (e){
        return PenaltyOperationFailure(errMsg: e.toString());
      }
    
    }
}
