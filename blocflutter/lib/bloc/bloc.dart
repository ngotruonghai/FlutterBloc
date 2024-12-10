import 'Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(1) {
    on<InCreateEvent>((event, emit) => _increase(emit));
    on<DeCreateEvent>((event, emit) => _decrese(emit));
  }

  _increase(Emitter emit) {
    emit(state + 1);
  }

  _decrese(Emitter emit) {
    emit(state - 1);
  }
}
