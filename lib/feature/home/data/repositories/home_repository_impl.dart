



import 'package:mom_plus/core/exceptions/failures.dart';
import 'package:mom_plus/core/service/request_service.dart';
import 'package:mom_plus/core/utils/either.dart';
import 'package:mom_plus/feature/home/data/datasource/home_datasource.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';
import 'package:mom_plus/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  final RequestHandlerService service;
  final HomeDataSource dataSource;

  const HomeRepositoryImpl({required this.service, required this.dataSource});

  @override
  Future<Either<Failure, List<BabyEntity>>> getBabies()async{
    return await service.handleRequestInRepository<List<BabyEntity>>(onRequest: ()=> dataSource.getBabies());
  }




}