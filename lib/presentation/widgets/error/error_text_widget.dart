import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final Widget? widgetMsg;

  const ErrorText({this.widgetMsg, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: widgetMsg);
  }
}
