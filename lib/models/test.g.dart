// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) => Test()
  ..name = json['name'] as String
  ..keywords =
      (json['keywords'] as List<dynamic>).map((e) => e as String).toList()
  ..age = json['age'] as num?
  ..weight = json['weight'] as num;

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'name': instance.name,
      'keywords': instance.keywords,
      'age': instance.age,
      'weight': instance.weight,
    };
