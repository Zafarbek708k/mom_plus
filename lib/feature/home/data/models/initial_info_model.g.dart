// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitialInfoModel _$InitialInfoModelFromJson(Map<String, dynamic> json) =>
    InitialInfoModel(
      head: (json['head'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$InitialInfoModelToJson(InitialInfoModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'head': instance.head,
    };
