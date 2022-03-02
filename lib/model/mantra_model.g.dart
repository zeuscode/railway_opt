// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mantra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MantraModel _$MantraModelFromJson(Map<String, dynamic> json) => MantraModel(
      id: json['id'] as int,
      code: json['code'] as String,
    interval:json['interval'] as String,
    qrCode: json['qrCode'] as String,
    );

Map<String, dynamic> _$MantraModelToJson(MantraModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'interval':instance.interval,
      'qrCode':instance.qrCode,
    };
