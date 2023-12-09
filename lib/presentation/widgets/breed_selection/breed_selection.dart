import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/ext/context_ext.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedSelection extends StatelessWidget {
  final BuildContext homeBlocContext;

  const BreedSelection({required this.homeBlocContext, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: BlocProvider.of<HomepageBloc>(homeBlocContext),
        child: BlocConsumer<HomepageBloc, HomepageState>(
            listener: (context, state) {},
            builder: (context, state) => Dialog(
                    child: Column(
                        mainAxisAlignment: state.status == HomePageStatus.loaded
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                      Visibility(
                          visible: state.status == HomePageStatus.loaded,
                          replacement: emptyWidget,
                          child: Row(
                            children: [
                              const Expanded(flex: 1, child: SizedBox()),
                              const Expanded(flex: 1, child: Text('Select a breed')),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      icon: const Icon(Icons.close)))
                            ],
                          )),
                      Visibility(
                        visible: state.status == HomePageStatus.loaded,
                        replacement: const CircularProgressIndicator(),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * .75,
                            child: ListView(children: [
                              ...state.breedList?.keys
                                      .map((breed) => ListTile(
                                          title: Text(breed),
                                          leading: const Icon(Icons.pets),
                                          onTap: () => context.homeBloc.add(
                                              OnSelection(
                                                  selectedBreed: breed,
                                                  selectedSubBreed: ''))))
                                      .toList() ??
                                  []
                            ]))
                      )
                    ])))
      );
}
