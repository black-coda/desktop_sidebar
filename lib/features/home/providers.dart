import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> selectedMenuProvider = StateProvider<int>((ref) => 0);
final StateProvider<bool> isSideMenuCollapsed =
    StateProvider<bool>((ref) => false);
