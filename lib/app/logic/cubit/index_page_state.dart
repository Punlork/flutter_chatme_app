part of 'index_page_cubit.dart';

class IndexPageState extends Equatable {
  final int currentIndex;

  const IndexPageState({required this.currentIndex});

  IndexPageState copyWith({int? index}) {
    return IndexPageState(currentIndex: index ?? currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
