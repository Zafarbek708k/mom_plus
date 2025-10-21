import 'package:mom_plus/core/exceptions/failures.dart';
import 'package:mom_plus/core/usecases/usecase.dart';
import 'package:mom_plus/core/utils/either.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';
import 'package:mom_plus/feature/home/domain/repositories/home_repository.dart';

class GetBabiesUseCase extends UseCase<List<BabyEntity>, NoParams> {
  final HomeRepository repository;

  const GetBabiesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BabyEntity>>> call(NoParams params) async {
    return await repository.getBabies();
  }
}
