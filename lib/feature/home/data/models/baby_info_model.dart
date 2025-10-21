import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';

part 'baby_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BabyInfoModel extends BabyInfoEntity {
  const BabyInfoModel({super.value, super.date, super.type, super.unit, super.isBirthDate, super.id, super.period});

  factory BabyInfoModel.fromJson(Map<String, dynamic> json) => _$BabyInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BabyInfoModelToJson(this);
}
