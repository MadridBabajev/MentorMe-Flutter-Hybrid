import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyNavigatorKey = GlobalKey<NavigatorState>();
final bottomNavProvider = StateProvider<int>((ref) => 0);
