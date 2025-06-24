import 'package:flutter/material.dart';

extension Sizes on BuildContext {
  getWidth({double? size = 1}) {
    return MediaQuery.sizeOf(this).width * size!;
  }

  getHeight({double? size = 1}) {
    return MediaQuery.sizeOf(this).height * size!;
  }
}
