import 'package:mom_plus/core/constants/app_const.dart';
import 'package:mom_plus/core/service/request_service.dart';
import 'package:mom_plus/feature/home/data/models/baby_model.dart';
import 'package:mom_plus/feature/home/data/models/history_model.dart';

abstract class HomeDataSource {
  const HomeDataSource();

  Future<List<BabyModel>> getBabies();

  Future<List<HistoryModel>> getHistories();
}

class HomeDatasourceImpl extends HomeDataSource {
  final RequestHandlerService service;

  const HomeDatasourceImpl({required this.service});

  @override
  Future<List<BabyModel>> getBabies() async {
    return await service.handleRequest(
      fromJson: (response) async {
        return (response.data as List).map((elem) => BabyModel.fromJson(elem)).toList();
      },
      method: RequestMethodEnum.get,
      path: EndPoints.babies,
    );
  }

  @override
  Future<List<HistoryModel>> getHistories() async {
    return await service.handleRequest(
      fromJson: (response) async {
        return (response.data as List).map((elem) => HistoryModel.fromJson(elem)).toList();
      },
      method: RequestMethodEnum.get,
      path: EndPoints.history,
    );
  }
}
