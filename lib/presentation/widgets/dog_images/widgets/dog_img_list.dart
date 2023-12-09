import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:dog_breeds/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImagesList extends StatelessWidget {
  const DogImagesList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) => state.status == HomePageStatus.loaded
              ? SliverGrid(
                  key: const Key('dog images list'),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  delegate: SliverChildBuilderDelegate(
                      addRepaintBoundaries: true,
                      addAutomaticKeepAlives: true,
                      addSemanticIndexes: true,
                      childCount:
                          (state?.imagesNumber ?? state.breedImages?.length),
                      (context, index) => Image.network(
                          state.breedImages![index],
                          semanticLabel: state.breedImages![index],
                          gaplessPlayback: true,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)))
              : const LoadingWidget());
}
