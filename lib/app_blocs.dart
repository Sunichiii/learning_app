import 'package:eu_learning/app_events.dart';
import 'package:eu_learning/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
      print(state.counter);
    });

    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
      print(state.counter);
    });
  }
}
