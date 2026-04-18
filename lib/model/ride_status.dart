enum RideStatus {
  active,
  completed;

  String get value {
    switch (this) {
      case active:
        return 'active';
      case completed:
        return 'completed';
    }
  }
}
