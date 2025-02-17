import 'package:bloc_learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_learning_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvents>((event, emit){
      emit(WelcomeState(page: state.page));
    });
  }
}