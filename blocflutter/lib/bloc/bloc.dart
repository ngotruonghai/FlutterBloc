import 'Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountBloc extends Bloc<CountEvent, List<int>> {
  CountBloc() : super([]) {
    on<InCreateEvent>((event, emit) => _increase(emit));
    on<DeCreateEvent>((event, emit) => _decrese(emit));
  }

  _increase(Emitter emit) {
    final updatedList = List<int>.from(state)..add(state.isEmpty ? 1 : state.last + 1);
    emit(updatedList);
  }

  _decrese(Emitter emit) {
     if (state.isNotEmpty) {
      final updatedList = List<int>.from(state)..removeLast();
      emit(updatedList);
    }
  }
}
