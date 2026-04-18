enum BikeStatus {
  available,
  inUse,
  maintenance;

  String get value {
    switch (this) {
      case available:
        return 'available';
      case inUse:
        return 'in_use';
      case maintenance:
        return 'maintenance';
    }
  }

  static BikeStatus from(String value) => BikeStatus.values.firstWhere(
    (e) => e.value == value,
    orElse: () => BikeStatus.available,
  );
}
