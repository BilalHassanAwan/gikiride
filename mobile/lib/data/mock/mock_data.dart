import '../../models/ride.dart';
import '../../models/driver.dart';

class MockData {
  static List<RideModel> recentRides = [
    RideModel(
      id: 'r_001',
      pickup: 'Hostel 8',
      destination: 'Academic Block',
      fare: 150.0,
      status: RideStatus.completed,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      driverId: 'drv_001',
    ),
    RideModel(
      id: 'r_002',
      pickup: 'Clock Tower',
      destination: 'Gate 2',
      fare: 200.0,
      status: RideStatus.completed,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      driverId: 'drv_002',
    ),
  ];

  static List<DriverModel> sampleDrivers = [
    DriverModel(
      id: 'drv_001',
      name: 'Ali Khan',
      rating: 4.9,
      vehicleModel: 'Honda Civic (White)',
      plateNumber: 'ABC-123',
      avatarUrl: 'https://i.pravatar.cc/150?img=33',
      location: 'Near Gate 1',
    ),
    DriverModel(
      id: 'drv_002',
      name: 'Osman Ahmed',
      rating: 4.7,
      vehicleModel: 'Toyota Corolla (Black)',
      plateNumber: 'XYZ-789',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      location: 'Faculty Club',
    ),
  ];

  static List<Map<String, dynamic>> mockMessages = [
    {
      'id': 'm_001',
      'senderId': 'drv_001',
      'text': 'I am near the hostel gate. Please come out.',
      'time': '10:42 AM',
      'isMe': false,
    },
    {
      'id': 'm_002',
      'senderId': 'user_001',
      'text': 'Okay, coming in 2 minutes!',
      'time': '10:43 AM',
      'isMe': true,
    },
  ];
}
