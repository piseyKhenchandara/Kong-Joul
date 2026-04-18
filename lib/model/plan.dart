enum PlanType {
  perRide,
  daily,
  weekly,
  monthly;

  /// The value stored in the Supabase `name` column.
  String get dbValue {
    switch (this) {
      case perRide:
        return 'per_ride';
      case daily:
        return 'daily';
      case weekly:
        return 'weekly';
      case monthly:
        return 'monthly';
    }
  }

  String get displayName {
    switch (this) {
      case perRide:
        return 'Pay Per Ride';
      case daily:
        return 'Daily Pass';
      case weekly:
        return 'Weekly Pass';
      case monthly:
        return 'Monthly Pass';
    }
  }

  static PlanType from(String value) => PlanType.values.firstWhere(
    // handle both 'per_ride' (DB) and 'perRide' (legacy) forms
    (e) => e.dbValue == value || e.name == value,
    orElse: () => PlanType.perRide,
  );
}

class Plan {
  final String id;
  final String planName;
  final double price;
  final int time;

  Plan({
    required this.planName,
    required this.price,
    required this.time,
    required this.id,
  });

  PlanType get type => PlanType.from(planName);
}
