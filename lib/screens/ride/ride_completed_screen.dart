import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RideCompletedScreen extends StatelessWidget {
  const RideCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(LucideIcons.checkCircle2, size: 100, color: theme.colorScheme.primary)
                  .animate()
                  .scale(duration: 500.ms, curve: Curves.easeOutBack),
              const SizedBox(height: 24),
              Text(
                'Ride Completed!',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium,
              ).animate().fade(delay: 300.ms).slideY(begin: 0.2),
              const SizedBox(height: 8),
              Text(
                'Hope you had a great trip.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.2),
              const SizedBox(height: 48),
              
              // Summary Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Text('Rs. 150', style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.primary)),
                    const SizedBox(height: 8),
                    const Text('Paid via Cash'),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat(context, 'Distance', '2.5 km'),
                        _buildStat(context, 'Time', '8 mins'),
                      ],
                    ),
                  ],
                ),
              ).animate().fade(delay: 500.ms).slideY(begin: 0.2),
              
              const SizedBox(height: 48),
              
              // Rating
              Text('Rate your driver', textAlign: TextAlign.center, style: theme.textTheme.titleMedium)
                  .animate().fade(delay: 600.ms),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => const Icon(Icons.star_border, size: 40, color: Colors.amber)),
              ).animate().fade(delay: 700.ms),
              
              const Spacer(),
              ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Back to Home'),
              ).animate().fade(delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(label, style: theme.textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
