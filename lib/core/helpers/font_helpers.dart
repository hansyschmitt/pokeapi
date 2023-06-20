import 'package:flutter/material.dart';

class FontHelpers {
  static MaterialStateProperty<T> toMaterialStateProperty<T>(T object) {
    return MaterialStateProperty.all(object);
  }
}
