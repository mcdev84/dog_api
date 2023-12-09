import 'package:dog_breeds/constants/styles/styles.dart';
import 'package:dog_breeds/ext/context_ext.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubBreedSelection extends StatelessWidget {
  final BuildContext homeBlocContext;

  const SubBreedSelection({required this.homeBlocContext, super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider.value(
          value: BlocProvider.of<HomepageBloc>(homeBlocContext),
          child: BlocConsumer<HomepageBloc, HomepageState>(
            builder: (context, state) =>
                Dialog(
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
                                  Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                      flex: 2,
                                      child: Text('Select a sub breed')),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          icon: Icon(Icons.close)))
                                ],
                              )),

                          Visibility(
                              visible: state.status == HomePageStatus.loaded,
                              replacement: const CircularProgressIndicator(),
                              child: SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * .75,
                                  child:
                                    state.breedList?[state.selectedBreed].isNotEmpty
                            ?  ListView(children: [
                              ...state.breedList?[state.selectedBreed].map(
                                  (subbreed) => ListTile(
                                      title: Text(subbreed),
                                      leading: const Icon(Icons.pets),
                                      onTap: () => context.homeBloc.add(
                                          OnSelection(
                                              selectedSubBreed: subbreed))))
                            ])
                              :Text('No sub breed found')
                              ),
          )
          ])

  )

  ,

  listener

      :

  (context, state)

  {
}),
);
}
/*
Autocomplete<String>(
optionsBuilder: (subBreedInput) {
if (subBreedInput.text.isEmpty ||
(state.selectedBreed?.isEmpty ?? false)) {
return [];
} else {
final _subList = List<String>.from(
state.breedList?[state.selectedBreed]);
return _subList.where((subreed) => subreed
    .contains(subBreedInput.text.toLowerCase()));
}
},
onSelected: (subBreed) => context.homeBloc
    .add(OnSelection(selectedSubBreed: subBreed))),*/
