abstract class BreedImagesRepository {
  /// Breed images [number]
  Future<List<String>> getAllBreedImages({required String breed});

  Future<List<String>> getRandomNumberBreedImages(
      {required String breed, required int number});

  /// Sub breed images [number]
  Future<List<String>> getAllSubBreedImages(
      {required String breed, required String subreed});

  Future<List<String>> getRandomNumberSubBreedImages(
      {required String breed, required String subreed, required int number});

  /// Random image / images [number]
  Future<List<String>> getRandomImages({int? number});
}
