import 'package:mom_plus/core/exceptions/failures.dart';
import 'package:mom_plus/core/utils/either.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';

abstract class HomeRepository {

  const HomeRepository();

  Future<Either<Failure, List<BabyEntity>>> getBabies();
}
