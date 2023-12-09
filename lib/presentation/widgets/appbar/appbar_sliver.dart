import 'package:dog_breeds/constants/colors/colors.dart';
import 'package:dog_breeds/constants/sizes/size_constants.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:dog_breeds/presentation/widgets/breed_selection/breed_selection.dart';
import 'package:dog_breeds/presentation/widgets/buttons/select_breed_button.dart';
import 'package:dog_breeds/presentation/widgets/buttons/select_images_number_button.dart';
import 'package:dog_breeds/presentation/widgets/buttons/select_sub_breed_button.dart';
import 'package:dog_breeds/presentation/widgets/images_number_selection/images_number_selection.dart';
import 'package:dog_breeds/presentation/widgets/sub_breed_selection/sub_breed_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        builder: (homeBlocContext, state) {
          return SliverAppBar(
              bottom: AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 50,
                  title: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () => showDialog(
                                context: homeBlocContext,
                                builder: (context) => BreedSelection(
                                    homeBlocContext: homeBlocContext)),
                            child: const SelectBreedButton()),
                        TextButton(
                            onPressed: () => showDialog(
                                context: homeBlocContext,
                                builder: (context) => SubBreedSelection(
                                    homeBlocContext: homeBlocContext)),
                            child: const SelectSubBreedButton()),
                        TextButton(
                            onPressed: () => showDialog(
                                context: homeBlocContext,
                                builder: (context) => ImagesNumberSelection(
                                    homeBlocContext: homeBlocContext)),
                            child: const SelectImageNumberButton())
                      ],
                    ),
                  )),
              key: const ValueKey(name),
              backgroundColor: happyYellow,
              pinned: true,
              floating: true,
              title: const Text('DOG API'),
              snap: true,
              centerTitle: true);
        },
      );

  @override
  Size get preferredSize => appBarSize;
}
