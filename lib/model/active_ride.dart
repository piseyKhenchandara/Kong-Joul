class ActiveRide {
  final String id;
  final String bikeId;
  final String bikeNumber;
  final String startStationId;
  final int startSlotNumber;
  final DateTime startTime;

  const ActiveRide({
    required this.id,
    required this.bikeId,
    required this.bikeNumber,
    required this.startStationId,
    required this.startSlotNumber,
    required this.startTime,
  });
}
