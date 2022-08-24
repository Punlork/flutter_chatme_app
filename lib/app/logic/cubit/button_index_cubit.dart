import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_index_state.dart';

class ButtonIndexCubit extends Cubit<ButtonIndexState> {
  ButtonIndexCubit() : super(ButtonIndexState(0));

  void getIndex(int i) {
    emit(ButtonIndexState(i));
  }
}
