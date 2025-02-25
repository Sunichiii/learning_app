import 'package:e_learning/pages/register/bloc/register_events.dart';
import 'package:e_learning/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
  RegisterBlocs(): super(RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<RegisterEmailEvent>(_emailEvent);
    on<RegisterPasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates>emit){
    emit(state.copyWith(userName:event.userName));
  }

  void _emailEvent(RegisterEmailEvent event, Emitter<RegisterStates>emit){
    emit(state
    .copyWith(email: event.email));
  }

  void _passwordEvent(RegisterPasswordEvent event, Emitter<RegisterStates>emit){
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates>emit){
    emit(state.copyWith(rePassword: event.rePass));
  }
}