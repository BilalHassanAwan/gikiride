import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../services/auth_service.dart';
import '../../widgets/glass_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<AuthService>().currentUser;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning, ${user?.name ?? 'Student'}',
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        'Ready for your ride?',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(LucideIcons.bell),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(user?.avatarUrl ?? 'https://i.pravatar.cc/150?img=11'),
                        radius: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Main Card
              GlassCard(
                color: theme.colorScheme.primary.withOpacity(0.1),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(LucideIcons.mapPin, color: theme.colorScheme.primary),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text('Current Location: Hostel 8'),
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      children: [
                        Icon(LucideIcons.search, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Where to?',
                            style: TextStyle(
                              color: theme.colorScheme.onSurface.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Pickup Now'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Schedule'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Quick Actions
              Text('Quick Actions', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickAction(context, LucideIcons.car, 'Find Ride', theme.colorScheme.primary, onTap: () => context.go('/map')),
                  _buildQuickAction(context, LucideIcons.plusCircle, 'Offer Ride', Colors.orange, onTap: () => context.push('/offer_ride')),
                  _buildQuickAction(context, LucideIcons.bus, 'Shuttle', Colors.teal),
                  _buildQuickAction(context, LucideIcons.shieldAlert, 'Emergency', Colors.red),
                ],
              ),
              const SizedBox(height: 32),

              // Nearby Activity
              Text('Nearby Activity', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              GlassCard(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                        child: Icon(LucideIcons.car, color: theme.colorScheme.primary),
                      ),
                      title: const Text('5 Drivers Available'),
                      subtitle: const Text('Near Academic Block'),
                      trailing: const Text('2 mins'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.withOpacity(0.1),
                        child: const Icon(LucideIcons.bus, color: Colors.teal),
                      ),
                      title: const Text('Library Shuttle'),
                      subtitle: const Text('Arriving at Hostel 8'),
                      trailing: const Text('5 mins'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, IconData icon, String label, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
