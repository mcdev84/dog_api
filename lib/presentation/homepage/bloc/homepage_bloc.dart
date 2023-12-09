import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dog_breeds/data/repositories/breed_images/breed_images_repository.dart';
import 'package:dog_breeds/data/repositories/breed_list/breed_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'homepage_event.dart';

part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final BreedListRepository _breedListRepository;
  final BreedImagesRepository _breedImagesRepository;

  HomepageBloc(this._breedListRepository, this._breedImagesRepository)
      : super(const HomepageState(status: HomePageStatus.initial)) {
    on<LoadBreeds>((event, emit) async {
      final _response = await _breedListRepository.loadBreeds();
      emit(state.copyWith(
          newStatus: HomePageStatus.loaded, newBreedList: _response));
    });
    on<OnSelection>((event, emit) {
      emit(state.copyWith(
          newStatus: HomePageStatus.loaded,
          newSelectedBreed: event.selectedBreed,
          newSelectedSubBreed: event.selectedSubBreed,
          newImagesNumber: event.imagesNumber));
    });
    on<GetImages>((event, emit) async {
      emit(state.copyWith(newStatus: HomePageStatus.loading));
      Future<List<String>> _response() async {
        var res;
        final _condition1 = state.selectedBreed.isNotEmpty;
        final _condition2 = state.selectedSubBreed.isNotEmpty;
        final _condition3 = (state.selectedSubBreed.isEmpty);


        if ( _condition2) {
          res = await _breedImagesRepository.getRandomNumberBreedImages(
              breed: state.selectedBreed, number: state.imagesNumber);
        } else if (_condition2) {
          res = await _breedImagesRepository.getAllSubBreedImages(
              breed: state.selectedBreed, subreed: state.selectedSubBreed);
        } else if (_condition3) {
          res = await _breedImagesRepository.getRandomNumberBreedImages(
              breed: state.selectedBreed, number: state.imagesNumber);
        } else {
          res = await _breedImagesRepository.getRandomImages(
              number: state.imagesNumber);
        }
        return res;
      }

      final fetchedImages = await _response();
      emit(state.copyWith(
        newStatus: HomePageStatus.loaded,
        newBreedImages: fetchedImages,
      ));
    });
  }
}
