import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'index_page_state.dart';

class IndexPageCubit extends Cubit<IndexPageState> {
  IndexPageCubit() : super(IndexPageState(currentIndex: 1));

  void getIndex(int i) {
    emit(state.copyWith(index: i));
  }
}
