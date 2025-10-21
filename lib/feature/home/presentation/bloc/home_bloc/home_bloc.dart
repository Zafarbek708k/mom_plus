import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mom_plus/core/service/service_locator.dart';
import 'package:mom_plus/core/usecases/usecase.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/history_entity.dart';
import 'package:mom_plus/feature/home/domain/usecases/get_babies_usecase.dart';
import 'package:mom_plus/feature/home/domain/usecases/get_histories_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final getBabiesUseCase = GetBabiesUseCase(repository: serviceLocator.call());
  final getHistoriesUseCase = GetHistoriesUseCase(repository: serviceLocator.call());

  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetBabiesEvent>(_getBabies);
    on<GetHistoriesEvent>(_getHistories);
  }

  FutureOr<void> _getHistories(GetHistoriesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(historyStatus: FormzSubmissionStatus.inProgress));
    final res = await getHistoriesUseCase.call(NoParams());
    res.either(
      (failure) {
        emit(state.copyWith(historyStatus: FormzSubmissionStatus.failure));
      },
      (histories) {
        emit(state.copyWith(historyStatus: FormzSubmissionStatus.success, histories: histories));
      },
    );
  }

  FutureOr<void> _getBabies(GetBabiesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getBabiesStatus: FormzSubmissionStatus.inProgress));

    final response = await getBabiesUseCase.call(NoParams());

    response.either(
      (failure) {
        emit(state.copyWith(getBabiesStatus: FormzSubmissionStatus.failure));
      },
      (babies) {
        final birthDateInfoWeight = babies.first.weight.where((elem) => elem.isBirthDate).toList();
        final birthDateInfoHeight = babies.first.height.where((elem) => elem.isBirthDate).toList();
        final birthDateInfoHead = babies.first.head.where((elem) => elem.isBirthDate).toList();

        final history = [...babies.first.head, ...babies.first.height, ...babies.first.weight];
        emit(
          state.copyWith(
            getBabiesStatus: FormzSubmissionStatus.success,
            babies: babies,
            birthDateWeight: birthDateInfoWeight,
            birthDateHeight: birthDateInfoHeight,
            birthDateHead: birthDateInfoHead,
            history: history,
          ),
        );
      },
    );
  }
}
