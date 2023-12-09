import 'package:dog_breeds/presentation/widgets/appbar/appbar_sliver.dart';
import 'package:dog_breeds/presentation/widgets/buttons/get_images_button.dart';
import 'package:dog_breeds/presentation/widgets/buttons/get_random_images_button.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;

  const PageTemplate({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: CustomScrollView(slivers: [
        const ApplicationBar(),
        const GetImagesButton(),
        const GetRandomImagesButton(),
        child
      ])));
}
