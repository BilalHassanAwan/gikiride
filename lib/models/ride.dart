enum RideStatus {
  searching,
  matched,
  inProgress,
  completed,
  cancelled
}

class RideModel {
  final String id;
  final String pickup;
  final String destination;
  final double fare;
  final RideStatus status;
  final DateTime timestamp;
  final String? driverId;

  RideModel({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.fare,
    required this.status,
    required this.timestamp,
    this.driverId,
  });
}
