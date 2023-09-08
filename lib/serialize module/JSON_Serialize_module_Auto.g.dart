// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JSON_Serialize_module_Auto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
