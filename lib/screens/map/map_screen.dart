import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/ride_service.dart';
import '../../widgets/glass_card.dart';
import 'booking_bottom_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  void _showBookingSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const BookingBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rideService = context.watch<RideService>();

    return Scaffold(
      body: Stack(
        children: [
          // Mock Map Background
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(color: theme.colorScheme.onSurface.withOpacity(0.05)),
            ),
          ),
          
          // Map Elements (Routes, Pins)
          Positioned(
            top: 250,
            left: 150,
            child: Icon(Icons.location_on, size: 48, color: theme.colorScheme.primary)
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms),
          ),

          // Top Search Bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(LucideIcons.menu, color: theme.colorScheme.onSurface),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Search destination',
                      style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5), fontSize: 16),
                    ),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.surface,
                    child: Icon(LucideIcons.search, size: 16, color: theme.colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Floating Action Button to trigger booking sheet
          Positioned(
            bottom: 32,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: theme.colorScheme.surface,
              child: Icon(LucideIcons.navigation, color: theme.colorScheme.primary),
            ),
          ),

          // If not searching and no ride matched, show the initiate booking button
          if (!rideService.isSearching && rideService.matchedDriver == null)
            Positioned(
              bottom: 32,
              left: 16,
              right: 80,
              child: ElevatedButton(
                onPressed: _showBookingSheet,
                child: const Text('Book a Ride'),
              ),
            ),

          // Searching overlay
          if (rideService.isSearching)
            Positioned.fill(
              child: Container(
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.colorScheme.primary, width: 2),
                          ),
                        ).animate(onPlay: (c) => c.repeat()).scale(duration: 1500.ms).fadeOut(duration: 1500.ms),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.colorScheme.primary, width: 2),
                          ),
                        ).animate(onPlay: (c) => c.repeat()).scale(duration: 1500.ms, delay: 500.ms).fadeOut(duration: 1500.ms),
                        Icon(LucideIcons.search, size: 48, color: theme.colorScheme.primary),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Finding the best driver near you...',
                      style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => context.read<RideService>().cancelSearch(),
                      child: const Text('Cancel Request'),
                    ),
                  ],
                ),
              ),
            ),

          // Driver Matched Sheet Overlay
          if (rideService.matchedDriver != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GlassCard(
                borderRadius: 24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 16),
                    Text('Driver Matched!', style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary)),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(rideService.matchedDriver!.avatarUrl),
                      ),
                      title: Text(rideService.matchedDriver!.name),
                      subtitle: Text('${rideService.matchedDriver!.vehicleModel} • ${rideService.matchedDriver!.plateNumber}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(rideService.matchedDriver!.rating.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {}, // Simulated call
                            icon: const Icon(LucideIcons.phone),
                            label: const Text('Call'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => context.push('/chat/${rideService.matchedDriver!.id}'),
                            icon: const Icon(LucideIcons.messageSquare),
                            label: const Text('Message'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          rideService.startRide();
                          context.go('/ride_in_progress');
                        },
                        child: const Text('Track Ride'),
                      ),
                    )
                  ],
                ),
              ).animate().slideY(begin: 1.0, duration: 300.ms, curve: Curves.easeOutQuad),
            )
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double gridSize = 40.0;
    
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
