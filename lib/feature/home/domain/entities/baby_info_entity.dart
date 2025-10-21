import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/data/models/baby_info_model.dart';

class BabyInfoEntity extends Equatable {
  final double value;
  final String type;
  final String id;
  final String period;
  final String unit;
  final String date;
  final bool isBirthDate;

  const BabyInfoEntity({
    this.value = 0,
    this.type = '',
    this.date = '',
    this.unit = '',
    this.id = '',
    this.period = '',
    this.isBirthDate = false,
  });

  @override
  List<Object?> get props => [value, type, unit, date, isBirthDate, id, period];
}

class BabyInfoEntityConvertor implements JsonConverter<BabyInfoEntity, Map<String, dynamic>?> {
  const BabyInfoEntityConvertor();

  @override
  BabyInfoEntity fromJson(Map<String, dynamic>? json) {
    return BabyInfoModel.fromJson(json ?? {});
  }

  @override
  Map<String, dynamic>? toJson(BabyInfoEntity object) => {};
}
