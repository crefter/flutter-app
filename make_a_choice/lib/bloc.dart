import 'package:bloc/bloc.dart';

class BlocButton extends Bloc<PushButton, int> {
  BlocButton(super.initialState);

  // on<PushButton>(PushButton event, Emitter<int> emit) {
  //   emit(state);
}
// }

abstract class PushButton {}

class leftOpen extends PushButton {}

class rightOpen extends PushButton {}
