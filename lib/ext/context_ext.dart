import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BuildContextExtension on BuildContext {
  HomepageBloc get homeBloc => read<HomepageBloc>();
}
