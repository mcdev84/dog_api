import 'package:flutter/material.dart';

final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;

final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

final Size viewSize =
    Size(physicalWidth / devicePixelRatio, physicalHeight / devicePixelRatio);

final Size appBarSize = Size(viewSize.width, viewSize.height * .1);
final Size actionButtonSize = Size(viewSize.width*.33, viewSize.height * .05);