import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OfferRideScreen extends StatefulWidget {
  const OfferRideScreen({super.key});

  @override
  State<OfferRideScreen> createState() => _OfferRideScreenState();
}

class _OfferRideScreenState extends State<OfferRideScreen> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Mode')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.steeringWheel, size: 80, color: _isOnline ? theme.colorScheme.primary : Colors.grey),
            const SizedBox(height: 24),
            Text(
              _isOnline ? 'You are Online' : 'Go Online to Receive Requests',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 48),
            SwitchListTile(
              title: const Text('Driver Mode Active'),
              subtitle: const Text('Toggle to receive ride requests'),
              value: _isOnline,
              onChanged: (val) {
                setState(() => _isOnline = val);
              },
            ),
            if (_isOnline) ...[
              const SizedBox(height: 32),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              const Text('Listening for nearby students...'),
            ]
          ],
        ),
      ),
    );
  }
}
