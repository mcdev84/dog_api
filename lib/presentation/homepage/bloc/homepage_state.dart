part of 'homepage_bloc.dart';

enum HomePageStatus { initial, loading, loaded, error }

@immutable
class HomepageState extends Equatable {
  final HomePageStatus status;
  final Map<String, dynamic> breedList;
  final String selectedBreed, selectedSubBreed;
  final int imagesNumber;
  final List<String> breedImages;
  final DioException? dioException;

  const HomepageState(
      {required this.status,
      this.breedList = const {},
      this.selectedBreed = '',
      this.selectedSubBreed = '',
      this.imagesNumber = 1,
      this.breedImages = const [],
      this.dioException});

  @override
  List<Object?> get props => [
        breedList,
        selectedBreed,
        selectedSubBreed,
        status,
        breedImages,
        imagesNumber,
        dioException
      ];

  HomepageState copyWith(
          {required HomePageStatus newStatus,
          Map<String, dynamic>? newBreedList,
          String? newSelectedBreed,
          String? newSelectedSubBreed,
          int? newImagesNumber,
          List<String>? newBreedImages,
          DioException? newDioException}) =>
      HomepageState(
          status: newStatus,
          breedList: newBreedList ?? breedList,
          selectedBreed: newSelectedBreed ?? selectedBreed,
          selectedSubBreed: newSelectedSubBreed ?? selectedSubBreed,
          imagesNumber: newImagesNumber ?? imagesNumber,
          breedImages: newBreedImages ?? breedImages,
          dioException: newDioException ?? dioException);
}
