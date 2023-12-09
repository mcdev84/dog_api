import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSubBreedButton extends StatelessWidget {
  const SelectSubBreedButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) => Visibility(
              visible: (state.selectedBreed != null &&
                  state.selectedBreed!.isNotEmpty),
              child: (state.selectedSubBreed != null &&
                      state.selectedSubBreed!.isNotEmpty)
                  ? Text(
                      state.selectedSubBreed!.toUpperCase(), style: selectionBarStyle)
                  : const Text('Sub breed',
                  style: selectionBarStyle)));
}
