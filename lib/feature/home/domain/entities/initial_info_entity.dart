import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/data/models/initial_info_model.dart';

class InitialInfoEntity extends Equatable {
  final double weight;
  final double height;
  final double head;

  const InitialInfoEntity({this.weight = 0, this.height = 0, this.head = 0});

  @override
  List<Object?> get props => [weight, height, head];
}

class InitialInfoEntityConvertor implements JsonConverter<InitialInfoEntity, Map<String, dynamic>?> {
  const InitialInfoEntityConvertor();

  @override
  InitialInfoEntity fromJson(Map<String, dynamic>? json) {
    return InitialInfoModel.fromJson(json ?? {});
  }

  @override
  Map<String, dynamic>? toJson(InitialInfoEntity object) => {};
}
