import 'package:json_annotation/json_annotation.dart';

part 'dogs_entity.g.dart';

@JsonSerializable()
class DogBreeds {
  final String breed;
  final List<dynamic> sub_breed;

  DogBreeds({required this.breed, required this.sub_breed});

  factory DogBreeds.fromJson(Map<String, dynamic> json) =>
      _$DogBreedsFromJson(json);

  Map<String, dynamic> toJson() => _$DogBreedsToJson(this);
}
