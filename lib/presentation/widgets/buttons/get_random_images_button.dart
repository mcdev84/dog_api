import 'package:dog_breeds/constants/sizes/size_constants.dart';
import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/ext/context_ext.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRandomImagesButton extends StatelessWidget {
  const GetRandomImagesButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) => SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(
                  child: Visibility(
                      visible: state.selectedBreed == null,
                      replacement: emptyWidget,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: actionButtonSize.width + 50,
                                height: actionButtonSize.height,
                                child: FloatingActionButton(
                                    mini: true,
                                    elevation: 6,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onPressed: () =>
                                        context.homeBloc.add(GetImages()),
                                    child: Text((state.imagesNumber != null &&
                                            state.imagesNumber! > 1)
                                        ? 'Random images'
                                        : 'Random image')))
                          ])))));
}
