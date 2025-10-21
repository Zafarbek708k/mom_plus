// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyModel _$BabyModelFromJson(Map<String, dynamic> json) => BabyModel(
  head:
      (json['head'] as List<dynamic>?)
          ?.map(
            (e) => const BabyInfoEntityConvertor().fromJson(
              e as Map<String, dynamic>?,
            ),
          )
          .toList() ??
      const [],
  height:
      (json['height'] as List<dynamic>?)
          ?.map(
            (e) => const BabyInfoEntityConvertor().fromJson(
              e as Map<String, dynamic>?,
            ),
          )
          .toList() ??
      const [],
  weight:
      (json['weight'] as List<dynamic>?)
          ?.map(
            (e) => const BabyInfoEntityConvertor().fromJson(
              e as Map<String, dynamic>?,
            ),
          )
          .toList() ??
      const [],
  birthDate: json['birth_date'] as String? ?? '',
  gender: json['gender'] as String? ?? '',
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  initialInfo:
      json['initial_info'] == null
          ? const InitialInfoEntity()
          : const InitialInfoEntityConvertor().fromJson(
            json['initial_info'] as Map<String, dynamic>?,
          ),
);

Map<String, dynamic> _$BabyModelToJson(BabyModel instance) => <String, dynamic>{
  'name': instance.name,
  'birth_date': instance.birthDate,
  'id': instance.id,
  'gender': instance.gender,
  'initial_info': const InitialInfoEntityConvertor().toJson(
    instance.initialInfo,
  ),
  'weight':
      instance.weight.map(const BabyInfoEntityConvertor().toJson).toList(),
  'height':
      instance.height.map(const BabyInfoEntityConvertor().toJson).toList(),
  'head': instance.head.map(const BabyInfoEntityConvertor().toJson).toList(),
};
