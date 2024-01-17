import 'package:repasse_anou/features/dressing/models/dressing_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dressing_filter_controller.g.dart';

@Riverpod(keepAlive: true)
class DressingFilterController extends _$DressingFilterController {
  @override
  DressingFilter build() {
    return const DressingFilter();
  }

  void setFilter(DressingFilter filter) {
    state = filter;
  }

  void resetFilter() {
    state = const DressingFilter();
  }
}
