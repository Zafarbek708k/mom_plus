// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
  date:
      (json['date'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => const BabyInfoEntityConvertor().fromJson(
              e as Map<String, dynamic>?,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$HistoryModelToJson(
  HistoryModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'items': instance.items.map(const BabyInfoEntityConvertor().toJson).toList(),
};
