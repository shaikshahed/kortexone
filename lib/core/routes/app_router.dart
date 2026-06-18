import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'route_names.dart';
import '../services/storage/secure_storage_service.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/ira/presentation/screens/ira_screen.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';

@lazySingleton
class AppRouter {
  final SecureStorageService _secureStorage;

  AppRouter(this._secureStorage);

  late final GoRouter router = GoRouter(
    initialLocation: RouteNames.root,
    redirect: (BuildContext context, GoRouterState state) async {
      final hasToken = await _secureStorage.containsKey('access_token');
      final authState = context.read<AuthBloc>().state;
      final isAuthenticated = hasToken || authState is AuthAuthenticated;

      final onSplash = state.matchedLocation == RouteNames.root;
      final loggingIn = state.matchedLocation == RouteNames.login;
      final onOtp = state.matchedLocation == RouteNames.otp;

      // Allow splash screen to render and run its timer/animation
      if (onSplash) {
        return null;
      }

      // Guard routing: If not authenticated, redirect to Login unless on OTP page
      if (!isAuthenticated && !onOtp && !loggingIn) {
        return RouteNames.login;
      }

      // If already authenticated and heading to login or OTP page, redirect to IRA Page
      if (isAuthenticated && (loggingIn || onOtp)) {
        return RouteNames.ira;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.root,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.otp,
        builder: (context, state) {
          final args = state.extra as OtpScreenArguments;
          return OtpScreen(
            email: args.email,
            password: args.password,
            maskedEmail: args.maskedEmail,
          );
        },
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.ira,
        builder: (context, state) => const IraScreen(),
      ),
    ],
  );
}
