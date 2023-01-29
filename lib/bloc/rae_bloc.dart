import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rae_test/exception/custom_exception.dart';
import 'package:rae_test/service/rae_service.dart';

part 'rae_event.dart';
part 'rae_state.dart';

class RaeBloc extends Bloc<RaeEvent, RaeState> {
  RaeService raeService;
  RaeBloc({required this.raeService}) : super(RaeInitial()) {
    on<RaeEvent>(
      (event, emit) async {
        if (event is RaeSubmit) {
          emit(RaeLoading());
          await _submitToState(event, emit);
          return;
        }

        if (event is RaeRestore) {
          emit(RaeRestored());
        }

        if (event is RaeValidationFails) {
          emit(
            RaeNotValid(
              word: state.word,
              notFound: state.notFound,
              searchFAB: false,
            ),
          );
        }
      },
      //transformer: restartable(),
    );
  }

  Future<void> _submitToState(RaeSubmit event, Emitter emit) async {
    final _word = event.word;
    try {
      final _description = await raeService.consult(_word);
      emit(RaeSuccess(
        word: _word,
        result: _description,
        notFound: state.notFound,
        searchFAB: state.searchFAB,
      ));
    } on ResponseException {
      emit(RaeError());
    } on WordNotFoundException {
      emit(RaeNotFound(word: _word));
    }
  }
}
