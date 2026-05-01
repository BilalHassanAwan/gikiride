import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            secondary: Icon(LucideIcons.moon, color: theme.colorScheme.primary),
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark theme'),
            value: themeProvider.isDarkMode,
            onChanged: (val) => themeProvider.toggleTheme(val),
          ),
          const Divider(),
          ListTile(
            leading: Icon(LucideIcons.globe, color: theme.colorScheme.primary),
            title: const Text('Language'),
            subtitle: const Text('English (Default)'),
            trailing: const Icon(LucideIcons.chevronRight, size: 18),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(LucideIcons.bell, color: theme.colorScheme.primary),
            title: const Text('Notifications'),
            trailing: const Icon(LucideIcons.chevronRight, size: 18),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(LucideIcons.shieldCheck, color: theme.colorScheme.primary),
            title: const Text('Privacy'),
            trailing: const Icon(LucideIcons.chevronRight, size: 18),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(LucideIcons.users, color: theme.colorScheme.primary),
            title: const Text('Emergency Contacts'),
            trailing: const Icon(LucideIcons.chevronRight, size: 18),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Icon(LucideIcons.info, color: theme.colorScheme.onSurface.withOpacity(0.5)),
            title: const Text('App Version'),
            subtitle: const Text('v1.0.0 (Build 1)'),
          ),
        ],
      ),
    );
  }
}
