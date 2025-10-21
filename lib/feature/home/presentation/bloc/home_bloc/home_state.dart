part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus getBabiesStatus;
  final FormzSubmissionStatus historyStatus;
  final List<BabyEntity> babies;
  final List<BabyInfoEntity> birthDateWeight;
  final List<BabyInfoEntity> birthDateHeight;
  final List<BabyInfoEntity> birthDateHead;
  final List<BabyInfoEntity> history;
  final List<HistoryEntity> histories;

  const HomeState({
    this.getBabiesStatus = FormzSubmissionStatus.initial,
    this.historyStatus = FormzSubmissionStatus.initial,
    this.babies = const [],
    this.birthDateWeight = const [],
    this.birthDateHead = const [],
    this.birthDateHeight = const [],
    this.history = const [],
    this.histories = const [],
  });

  HomeState copyWith({
    FormzSubmissionStatus? getBabiesStatus,
    FormzSubmissionStatus? historyStatus,
    List<BabyEntity>? babies,
    List<BabyInfoEntity>? birthDateWeight,
    List<BabyInfoEntity>? birthDateHead,
    List<BabyInfoEntity>? birthDateHeight,
    List<BabyInfoEntity>? history,
    List<HistoryEntity>? histories,
  }) => HomeState(
    histories: histories ?? this.histories,
    historyStatus: historyStatus ?? this.historyStatus,
    getBabiesStatus: getBabiesStatus ?? this.getBabiesStatus,
    babies: babies ?? this.babies,
    history: history ?? this.history,
    birthDateWeight: birthDateWeight ?? this.birthDateWeight,
    birthDateHeight: birthDateHeight ?? this.birthDateHeight,
    birthDateHead: birthDateHead ?? this.birthDateHead,
  );

  @override
  List<Object?> get props => [
    getBabiesStatus,
    babies,
    birthDateWeight,
    birthDateHeight,
    birthDateHead,
    history,
    histories,
    historyStatus,
  ];
}
