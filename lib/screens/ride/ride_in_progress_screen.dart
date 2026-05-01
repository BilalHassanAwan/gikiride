import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../services/ride_service.dart';
import '../../widgets/glass_card.dart';
import '../map/map_screen.dart'; // For GridPainter

class RideInProgressScreen extends StatelessWidget {
  const RideInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rideService = context.watch<RideService>();
    final driver = rideService.matchedDriver;

    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(color: theme.colorScheme.onSurface.withOpacity(0.05)),
            ),
          ),
          
          // Route and Car (Mock)
          Positioned(
            top: 300,
            left: 200,
            child: Icon(Icons.navigation, size: 48, color: theme.colorScheme.primary),
          ),

          // Top App Bar like area
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: GlassCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.2), shape: BoxShape.circle),
                    child: Icon(LucideIcons.clock, color: theme.colorScheme.primary),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dropping off in 4 mins', style: theme.textTheme.titleMedium),
                        Text('Hostel 8 -> Academic Block', style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sheet with actions
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GlassCard(
              borderRadius: 32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 16),
                  if (driver != null)
                    ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(driver.avatarUrl)),
                      title: Text(driver.name),
                      subtitle: Text('${driver.vehicleModel} • ${driver.plateNumber}'),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                        child: Text(driver.rating.toString(), style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(LucideIcons.messageSquare, color: Colors.blue),
                    title: const Text('Message Driver'),
                    subtitle: const Text('Chat about pickup or drop-off'),
                    trailing: const Icon(LucideIcons.chevronRight),
                    onTap: () => context.push('/chat/${driver?.id ?? "drv_001"}'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(LucideIcons.shieldAlert, color: Colors.red),
                    title: const Text('Safety Share Trip'),
                    subtitle: const Text('Share live location with friends'),
                    trailing: const Icon(LucideIcons.chevronRight),
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.withOpacity(0.1),
                            foregroundColor: Colors.red,
                            elevation: 0,
                            side: const BorderSide(color: Colors.red),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('SOS Alert Sent to Campus Security!'), backgroundColor: Colors.red),
                            );
                          },
                          child: const Text('SOS'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            // Finish ride mock
                            context.read<RideService>().finishRide();
                            context.go('/ride_completed');
                          },
                          child: const Text('Finish Ride (Mock)'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
