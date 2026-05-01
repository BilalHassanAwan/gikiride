import 'package:flutter/material.dart';
import '../models/driver.dart';
import '../models/ride.dart';
import '../data/mock/mock_data.dart';

class RideService extends ChangeNotifier {
  bool _isSearching = false;
  DriverModel? _matchedDriver;
  RideStatus _currentStatus = RideStatus.cancelled;
  final List<Map<String, dynamic>> _messages = List.from(MockData.mockMessages);
  
  bool get isSearching => _isSearching;
  DriverModel? get matchedDriver => _matchedDriver;
  RideStatus get currentStatus => _currentStatus;
  List<Map<String, dynamic>> get messages => _messages;

  Future<void> findRide() async {
    _isSearching = true;
    _matchedDriver = null;
    _currentStatus = RideStatus.searching;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 4));

    _matchedDriver = MockData.sampleDrivers[0];
    _isSearching = false;
    _currentStatus = RideStatus.matched;
    notifyListeners();
  }
  
  void startRide() {
    _currentStatus = RideStatus.inProgress;
    notifyListeners();
  }
  
  void cancelSearch() {
    _isSearching = false;
    _matchedDriver = null;
    _currentStatus = RideStatus.cancelled;
    notifyListeners();
  }
  
  void finishRide() {
    _matchedDriver = null;
    _currentStatus = RideStatus.completed;
    notifyListeners();
  }

  void sendMessage(String text) {
    _messages.add({
      'id': 'm_${DateTime.now().millisecondsSinceEpoch}',
      'senderId': 'user_001',
      'text': text,
      'time': 'Just now',
      'isMe': true,
    });
    notifyListeners();

    // Mock auto-reply
    if (text.toLowerCase().contains('where')) {
      Future.delayed(const Duration(seconds: 2), () {
        _messages.add({
          'id': 'm_${DateTime.now().millisecondsSinceEpoch}',
          'senderId': 'drv_001',
          'text': 'I am just turning from the main road.',
          'time': 'Just now',
          'isMe': false,
        });
        notifyListeners();
      });
    }
  }
}
