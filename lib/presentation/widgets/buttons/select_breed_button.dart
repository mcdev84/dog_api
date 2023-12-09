import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBreedButton extends StatelessWidget {
  const SelectBreedButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        builder: (context, state) => Visibility(
              replacement: const Text('Breed',
                  style: selectionBarStyle),
              visible: state.selectedBreed != null &&
                  state.selectedBreed!.isNotEmpty,
              child: Text('${state.selectedBreed?.toUpperCase()}',
                  style: selectionBarStyle)),
      );
}
