import 'package:supabase_flutter/supabase_flutter.dart';

import '../dto/ride_dto.dart';
import '../../model/active_ride.dart';
import '../../model/bike_status.dart';
import '../../model/ride_status.dart';

class RideRepository {
  final _client = Supabase.instance.client;

  Future<ActiveRide> startRide({
    required String userId,
    required String bikeId,
    required String bikeNumber,
    required String stationId,
    required int slotNumber,
  }) async {
    final rideData = await _client.from('rides').insert({
      'user_id': userId,
      'bike_id': bikeId,
      'bike_number': bikeNumber,
      'start_station_id': stationId,
      'start_slot_number': slotNumber,
      'start_time': DateTime.now().toUtc().toIso8601String(),
      'status': RideStatus.active.value,
    }).select().single();

    await _client.from('bikes').update({
      'status': BikeStatus.inUse.value,
      'station_id': null,
      'slot_number': null,
    }).eq('id', bikeId);

    return RideDto.fromJson(rideData).toActiveRide();
  }

  Future<void> endRide({
    required String rideId,
    required String bikeId,
    required String endStationId,
    required int endSlotNumber,
    required int durationSeconds,
  }) async {
    await _client.from('rides').update({
      'end_station_id': endStationId,
      'end_slot_number': endSlotNumber,
      'end_time': DateTime.now().toUtc().toIso8601String(),
      'duration_seconds': durationSeconds,
      'status': RideStatus.completed.value,
    }).eq('id', rideId);

    await _client.from('bikes').update({
      'status': BikeStatus.available.value,
      'station_id': endStationId,
      'slot_number': endSlotNumber,
    }).eq('id', bikeId);
  }
}
