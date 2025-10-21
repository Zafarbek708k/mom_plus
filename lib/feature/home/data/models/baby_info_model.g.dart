// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyInfoModel _$BabyInfoModelFromJson(Map<String, dynamic> json) =>
    BabyInfoModel(
      value: (json['value'] as num?)?.toDouble() ?? 0,
      date: json['date'] as String? ?? '',
      type: json['type'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      isBirthDate: json['is_birth_date'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      period: json['period'] as String? ?? '',
    );

Map<String, dynamic> _$BabyInfoModelToJson(BabyInfoModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'id': instance.id,
      'period': instance.period,
      'unit': instance.unit,
      'date': instance.date,
      'is_birth_date': instance.isBirthDate,
    };
