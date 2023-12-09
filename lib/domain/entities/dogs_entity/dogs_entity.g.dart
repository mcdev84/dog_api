// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogs_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreeds _$DogBreedsFromJson(Map<String, dynamic> json) => DogBreeds(
      breed: json['breed'] as String,
      sub_breed:
          (json['sub_breed'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DogBreedsToJson(DogBreeds instance) => <String, dynamic>{
      'breed': instance.breed,
      'sub_breed': instance.sub_breed,
    };
