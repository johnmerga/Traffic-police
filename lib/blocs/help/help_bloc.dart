import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/data/data_provider/help_data_provider.dart';
import 'package:traffic_police/data/models/help.dart';
import 'package:traffic_police/data/repository/help_repository.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc() : super(HelpInitial());
  final HelpRepository repository = HelpRepository(HelpDataProvider());
  @override
  Stream<HelpState> mapEventToState(
    HelpEvent event,
  ) async* {
    if (event is FetchHelpByOfficer) {
      yield* await _handleHelpFetchByOfficer(event);
    } else if (event is FetchHelp) {
      yield* await _handleHelpFetch(event);
    } else if (event is FetchAcceptedHelp) {
      yield* await _handleAcceptedHelpFetch(event);
    } else if (event is DeleteHelp) {
      yield* await _handleHelpDelete(event);
    } else if (event is UpdateHelp) {
      yield* await _handleHelpUpdate(event);
    } else if (event is UpdateHelpStatus) {
      yield* await _handleHelpUpdateStatus(event);
    } else if (event is CreateHelp) {
      yield* await _handleHelpCreate(event);
    }
  }

  Stream<HelpState> _handleHelpFetch(FetchHelp event) async* {
    try {
      yield HelpLoadingState();
      final helps = await repository.fetchAllHelps();
      yield HelpListLoadedState(helps: helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleHelpFetchByOfficer(FetchHelpByOfficer event) async* {
    try {
      yield HelpLoadingState();
      final helps = await repository.fetchHelpByOfficer();
      yield HelpListLoadedState(helps: helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleAcceptedHelpFetch(FetchAcceptedHelp event) async* {
    try {
      yield HelpLoadingState();
      final helps = await repository.fetchAcceptedHelps();
      yield HelpListLoadedState(helps: helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleHelpCreate(CreateHelp event) async* {
    try {
      Help help = await repository.create(event.help);
      final _state = (state as HelpListLoadedState);
      _state.helps.add(help);
      yield HelpLoadingState();
      yield HelpListLoadedState(helps: _state.helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleHelpUpdate(UpdateHelp event) async* {
    try {
      await repository.update(event.help);
      final _state = (state as HelpListLoadedState);
      final index =
          _state.helps.indexWhere((element) => element.id == event.help.id);
      _state.helps[index] = event.help;
      yield HelpLoadingState();
      yield HelpListLoadedState(helps: _state.helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleHelpUpdateStatus(UpdateHelpStatus event) async* {
    try {
      await repository.updateStatus(event.help);
      final _state = (state as HelpListLoadedState);
      _state.helps.removeWhere((element) => element.id == event.help.id);
      yield HelpLoadingState();
      yield HelpListLoadedState(helps: _state.helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }

  Stream<HelpState> _handleHelpDelete(DeleteHelp event) async* {
    try {
      await repository.delete(event.help.id);
      final _state = (state as HelpListLoadedState);
      _state.helps.removeWhere((element) => element.id == event.help.id);
      yield HelpLoadingState();
      yield HelpListLoadedState(helps: _state.helps);
    } catch (e) {
      yield HelpErrorState(message: e.toString());
    }
  }
}
