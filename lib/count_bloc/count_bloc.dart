import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial(count: 0)) {
    on<Increment>((event, emit) {
      int c = state.count;
      c++;
      emit(CountState(count: c));
    });
    on<Decrement>((event, emit) {
      int c = state.count;
      c--;
      emit(CountState(count: c));
    });
  }
}
