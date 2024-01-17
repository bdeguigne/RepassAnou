import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repasse_anou/features/dressing/models/dressing_category.dart';
import 'package:repasse_anou/features/dressing/models/dressing_color.dart';
import 'package:repasse_anou/features/dressing/models/dressing_material.dart';

part 'dressing_filter.freezed.dart';

@freezed
abstract class DressingFilter with _$DressingFilter {
  const factory DressingFilter({
    final DressingCategory? category,
    final List<DressingMaterial>? material,
    final DressingColor? color,
  }) = _DressingFilter;
}
