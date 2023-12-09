import 'package:dog_breeds/constants/sizes/size_constants.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
      child: Container(
          height: viewSize.height * .5,
          alignment: Alignment.center,
          child: const CircularProgressIndicator()));
}
