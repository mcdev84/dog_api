import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectImageNumberButton extends StatelessWidget {
  const SelectImageNumberButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) => Visibility(
              replacement: const Text('+images', style: selectionBarStyle),
              visible: state.imagesNumber != null,
              child: Text('Images: ${state.imagesNumber}',
                  style: selectionBarStyle)));
}
