import 'package:get_it/get_it.dart';
import 'package:mom_plus/core/api/dio_settings.dart';
import 'package:mom_plus/core/service/request_service.dart';
import 'package:mom_plus/core/service/storage_service.dart';
import 'package:mom_plus/feature/home/data/datasource/home_datasource.dart';
import 'package:mom_plus/feature/home/data/repositories/home_repository_impl.dart';
import 'package:mom_plus/feature/home/domain/repositories/home_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  await StorageRepository.getInstance();

  serviceLocator.registerLazySingleton(() => DioSettings());
  serviceLocator.registerLazySingleton(() => RequestHandlerService(serviceLocator<DioSettings>().dio));

  serviceLocator.registerLazySingleton<HomeDataSource>(
    () => HomeDatasourceImpl(service: serviceLocator.call<RequestHandlerService>()),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      service: serviceLocator.call<RequestHandlerService>(),
      dataSource: serviceLocator.call<HomeDataSource>(),
    ),
  );
}
