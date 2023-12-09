part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}

class LoadBreeds extends HomepageEvent {}

class OnSelection extends HomepageEvent {
  final String? selectedBreed, selectedSubBreed;
  final int? imagesNumber;

  OnSelection({this.selectedBreed, this.selectedSubBreed, this.imagesNumber});
}

class GetImages extends HomepageEvent {}
