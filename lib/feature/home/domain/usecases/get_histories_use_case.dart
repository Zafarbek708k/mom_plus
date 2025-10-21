import 'package:mom_plus/core/exceptions/failures.dart';
import 'package:mom_plus/core/usecases/usecase.dart';
import 'package:mom_plus/core/utils/either.dart';
import 'package:mom_plus/feature/home/domain/entities/history_entity.dart';
import 'package:mom_plus/feature/home/domain/repositories/home_repository.dart';

class GetHistoriesUseCase extends UseCase<List<HistoryEntity>, NoParams> {
  final HomeRepository repository;

  const GetHistoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<HistoryEntity>>> call(NoParams params) async {
    return await repository.getHistories();
  }
}
