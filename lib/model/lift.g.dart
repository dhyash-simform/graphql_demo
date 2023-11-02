// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiftImpl _$$LiftImplFromJson(Map<String, dynamic> json) => _$LiftImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      night: json['night'] as bool,
    );

Map<String, dynamic> _$$LiftImplToJson(_$LiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'night': instance.night,
    };
