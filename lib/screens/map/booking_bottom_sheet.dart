import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import '../../services/ride_service.dart';

class BookingBottomSheet extends StatefulWidget {
  const BookingBottomSheet({super.key});

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  int _selectedType = 0;

  final List<Map<String, dynamic>> _rideTypes = [
    {'title': 'Bike', 'price': 'Rs. 50', 'icon': LucideIcons.bike, 'time': '2 min'},
    {'title': 'Car', 'price': 'Rs. 150', 'icon': LucideIcons.car, 'time': '5 min'},
    {'title': 'Shared', 'price': 'Rs. 80', 'icon': LucideIcons.users, 'time': '8 min'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Choose a ride', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          ...List.generate(_rideTypes.length, (index) {
            final isSelected = _selectedType == index;
            final type = _rideTypes[index];
            return GestureDetector(
              onTap: () => setState(() => _selectedType = index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.1),
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: isSelected ? theme.colorScheme.primary.withOpacity(0.05) : null,
                ),
                child: Row(
                  children: [
                    Icon(type['icon'], size: 32, color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(type['title'], style: theme.textTheme.titleMedium),
                          Text('${type['time']} away', style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ),
                    Text(
                      type['price'],
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? theme.colorScheme.primary : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(LucideIcons.creditCard, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              const Expanded(child: Text('Cash / EasyPaisa')),
              TextButton(onPressed: () {}, child: const Text('Change')),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<RideService>().findRide();
              },
              child: const Text('Confirm Ride'),
            ),
          ),
        ],
      ),
    );
  }
}
