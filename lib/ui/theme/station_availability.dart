import 'package:flutter/material.dart';
import 'package:mini_velo/ui/theme/app_colors.dart';

enum StationAvailability {
  low, // count <= 3 → red
  medium, // count < 6  → orange
  high // count >= 6 → green
  ;

  static StationAvailability fromCount(int count) {
    if (count <= 3) return low;
    if (count < 6) return medium;
    return high;
  }

  Color get color {
    switch (this) {
      case low:
        return Colors.red;
      case medium:
        return Colors.orange;
      case high:
        return AppColors.primary;
    }
  }
}
