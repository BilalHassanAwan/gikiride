import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RidesHistoryScreen extends StatelessWidget {
  const RidesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Rides History')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('12 May 2026 • 09:30 AM', style: theme.textTheme.bodySmall),
                      Text('Rs. 150', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(LucideIcons.circle, size: 12, color: theme.colorScheme.primary),
                          Container(height: 20, width: 2, color: theme.colorScheme.onSurface.withOpacity(0.2)),
                          Icon(LucideIcons.mapPin, size: 12, color: Colors.red),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Hostel 8'),
                            const SizedBox(height: 12),
                            const Text('Academic Block'),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 32),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=33'),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Ali Khan')),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          visualDensity: VisualDensity.compact,
                        ),
                        child: const Text('Rebook'),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
