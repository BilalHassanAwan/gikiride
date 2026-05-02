import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';

class SafetyCenterScreen extends StatelessWidget {
  const SafetyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Safety Center')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SOS Emergency Button
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {},
                icon: const Icon(LucideIcons.shieldAlert, size: 32),
                label: const Text('SOS Emergency', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),
            Text('Safety Features', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildSafetyTile(context, LucideIcons.share2, 'Share Live Ride', 'Share your route with trusted contacts', Colors.blue),
            _buildSafetyTile(context, LucideIcons.users, 'Trusted Contacts', 'Add family or friends to notify during a trip', Colors.green),
            _buildSafetyTile(context, LucideIcons.flag, 'Report Incident', 'Report unsafe driver or ride behaviour', Colors.orange),
            const SizedBox(height: 32),
            Text('Safety Tips', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildTip('Always verify the driver plate number before boarding.'),
            _buildTip('Share your ride status with a trusted friend.'),
            _buildTip('Ride only with GIKI-verified students.'),
            _buildTip('Trust your instincts — cancel if something feels off.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyTile(BuildContext context, IconData icon, String title, String subtitle, Color color) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(LucideIcons.chevronRight, size: 18),
      onTap: () {},
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(tip)),
        ],
      ),
    );
  }
}
