import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/domain/entities/initial_info_entity.dart';

part 'initial_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class InitialInfoModel extends InitialInfoEntity {
  const InitialInfoModel({super.head, super.height, super.weight});

  factory InitialInfoModel.fromJson(Map<String, dynamic> json) => _$InitialInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InitialInfoModelToJson(this);
}
