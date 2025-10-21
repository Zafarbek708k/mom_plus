import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/initial_info_entity.dart';

part 'baby_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BabyModel extends BabyEntity {
  const BabyModel({
    super.head,
    super.height,
    super.weight,
    super.birthDate,
    super.gender,
    super.id,
    super.name,
    super.initialInfo,
  });

  factory BabyModel.fromJson(Map<String, dynamic> json) => _$BabyModelFromJson(json);
}
