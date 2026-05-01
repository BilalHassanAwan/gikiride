import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/dashboard_screen.dart';
import '../screens/home/main_layout.dart';
import '../screens/ride/rides_history_screen.dart';
import '../screens/ride/ride_in_progress_screen.dart';
import '../screens/ride/ride_completed_screen.dart';
import '../screens/map/map_screen.dart';
import '../screens/inbox/inbox_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/driver/offer_ride_screen.dart';
import '../screens/inbox/chat_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/ride_in_progress',
      builder: (context, state) => const RideInProgressScreen(),
    ),
    GoRoute(
      path: '/offer_ride',
      builder: (context, state) => const OfferRideScreen(),
    ),
    GoRoute(
      path: '/ride_completed',
      builder: (context, state) => const RideCompletedScreen(),
    ),
    GoRoute(
      path: '/chat/:driverId',
      builder: (context, state) {
        final driverId = state.pathParameters['driverId']!;
        return ChatScreen(driverId: driverId);
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/rides',
          builder: (context, state) => const RidesHistoryScreen(),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/inbox',
          builder: (context, state) => const InboxScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
