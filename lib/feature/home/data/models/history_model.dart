import 'package:json_annotation/json_annotation.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/history_entity.dart';

part 'history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HistoryModel extends HistoryEntity {
  const HistoryModel({super.date, super.items});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}
