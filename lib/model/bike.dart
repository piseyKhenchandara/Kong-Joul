import 'bike_status.dart';

class Bike {
  final String id;
  final String bikeNumber;
  final int slotNumber;
  final BikeStatus status;

  const Bike({
    required this.id,
    required this.bikeNumber,
    required this.slotNumber,
    required this.status,
  });
}
