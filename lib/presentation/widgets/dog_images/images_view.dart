import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:dog_breeds/presentation/widgets/dog_images/widgets/dog_img_list.dart';
import 'package:dog_breeds/presentation/widgets/error/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) {
            final _condition =
                (state.breedImages != null && state.breedImages!.isNotEmpty);
            return _condition
                ? const DogImagesList()
                : const ErrorText( widgetMsg: emptyWidget);
          });
}
