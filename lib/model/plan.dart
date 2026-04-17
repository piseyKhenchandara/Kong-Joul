enum PlanEnum {
  perRide(3, 0),
  daily(5, 24),
  weekly(30, 168),
  monthly(100, 720);

  final int price;
  final int hour;

  const PlanEnum(this.price, this.hour);
}

class Plan {
  final String planName;
  final double price;
  final int time;
  String status; // not final because it can change

  Plan({
    required this.planName,
    required this.price,
    required this.time,
    this.status = "inactive", // default
  });

  // Factory constructor (better than your method)
  factory Plan.fromEnum(PlanEnum planEnum) {
    return Plan(planName: planEnum.name, price: planEnum.price.toDouble(), time: planEnum.hour);
  }
}
