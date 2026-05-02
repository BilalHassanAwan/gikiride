import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<AuthService>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.settings),
            onPressed: () {}, // Go to Settings
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profile Header
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user?.avatarUrl ?? 'https://i.pravatar.cc/150?img=11'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
                      child: const Icon(LucideIcons.edit2, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(user?.name ?? 'Student Name', style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified, size: 16, color: theme.colorScheme.primary),
                const SizedBox(width: 4),
                Text('Verified GIKI Student', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary)),
              ],
            ),
            const SizedBox(height: 32),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(context, 'Rides', '24'),
                Container(height: 40, width: 1, color: theme.colorScheme.onSurface.withOpacity(0.1)),
                _buildStatColumn(context, 'Rating', '4.9'),
                Container(height: 40, width: 1, color: theme.colorScheme.onSurface.withOpacity(0.1)),
                _buildStatColumn(context, 'Saved', 'Rs. 450'),
              ],
            ),
            const SizedBox(height: 32),

            // Menu Items
            _buildMenuItem(context, LucideIcons.mapPin, 'Saved Places'),
            _buildMenuItem(context, LucideIcons.creditCard, 'Payment Methods'),
            _buildMenuItem(context, LucideIcons.shieldCheck, 'Safety Center'),
            _buildMenuItem(context, LucideIcons.helpCircle, 'Help & Support'),
            
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {
                  context.read<AuthService>().logout();
                  context.go('/login');
                },
                icon: const Icon(LucideIcons.logOut),
                label: const Text('Log Out'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleLarge),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title),
      trailing: const Icon(LucideIcons.chevronRight, size: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      onTap: () {},
    );
  }
}
