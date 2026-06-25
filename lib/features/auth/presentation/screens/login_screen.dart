// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../core/constants/asset_constants.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go(RouteNames.ira);
          } else if (state is AuthOtpRequired) {
            context.push(
              RouteNames.otp,
              extra: OtpScreenArguments(
                email: state.email,
                password: state.password,
                maskedEmail: state.maskedEmail,
              ),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Stack(
          children: [
            // Background Glows (Radial gradients for dark theme)
            if (isDark) ...[
              // Top Right Purple Glow
              Positioned(
                top: -150,
                right: -150,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF581C87).withOpacity(0.25), // Deep Purple
                        const Color(0xFF581C87).withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom Left Indigo Glow
              Positioned(
                bottom: -200,
                left: -200,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF1E1B4B).withOpacity(0.35), // Deep Indigo
                        const Color(0xFF1E1B4B).withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            // Subtle Dotted Grid Overlay
            if (isDark)
              Positioned.fill(
                child: CustomPaint(
                  painter: DotGridPainter(),
                ),
              ),

            // Main Content Area
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),

                            // KortexOne Branding Logo Image
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AssetConstants.logo,
                                    height: 48,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'INTELLIGENCE, UNIFIED.',
                                    style: TextStyle(
                                      fontFamily: AppTypography.fontFamily,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 3.5,
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Card Container holding the inputs
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.surfaceDark : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isDark ? AppColors.cardBorderDark : Colors.black12,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(isDark ? 0.35 : 0.05),
                                    blurRadius: 25,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n?.loginTitle ?? 'Welcome back',
                                    style: TextStyle(
                                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    l10n?.loginSubtitle ?? 'Sign in to continue to KortexOne',
                                    style: TextStyle(
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 36),

                                  // Email Field
                                  CustomTextField(
                                    controller: _emailController,
                                    labelText: l10n?.emailLabel ?? 'EMAIL',
                                    hintText: l10n?.emailHint ?? 'you@company.com',
                                    prefixIcon: Icons.mail_outline_rounded,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return l10n?.emptyEmailError ?? 'Email cannot be empty';
                                      }
                                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                        return l10n?.invalidEmailError ?? 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 24),

                                  // Password Field
                                  CustomTextField(
                                    controller: _passwordController,
                                    labelText: l10n?.passwordLabel ?? 'PASSWORD',
                                    hintText: l10n?.passwordHint ?? 'Enter your password',
                                    prefixIcon: Icons.lock_outline_rounded,
                                    isPassword: true,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return l10n?.emptyPasswordError ?? 'Password cannot be empty';
                                      }
                                      if (value.length < 6) {
                                        return l10n?.passwordTooShortError ?? 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 12),

                                  // Forgot Password Option
                                  // Align(
                                  //   alignment: Alignment.centerRight,
                                  //   child: GestureDetector(
                                  //     onTap: () {
                                  //       ScaffoldMessenger.of(context).showSnackBar(
                                  //         SnackBar(
                                  //           content: Text(l10n?.forgotPassword ?? 'Forgot password tapped'),
                                  //           behavior: SnackBarBehavior.floating,
                                  //         ),
                                  //       );
                                  //     },
                                  //     child: Text(
                                  //       l10n?.forgotPassword ?? 'Forgot password?',
                                  //       style: TextStyle(
                                  //         color: isDark ? AppColors.linkPurple : AppColors.primary,
                                  //         fontSize: 12,
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 26),

                                  // Sign In Button
                                  BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      final isLoading = state is AuthLoading;
                                      return PrimaryButton(
                                        text: l10n?.signInButton ?? 'Sign In',
                                        isLoading: isLoading,
                                        borderRadius: 10,
                                        height: 48,
                                        icon: const Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState?.validate() ?? false) {
                                            context.read<AuthBloc>().add(
                                                  AuthLoginRequested(
                                                    email: _emailController.text.trim(),
                                                    password: _passwordController.text,
                                                  ),
                                                );
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 48),

                            // Copyright Footer
                            Center(
                              child: Text(
                                l10n?.copyright ?? '© 2026 KortexOne. All rights reserved.',
                                style: TextStyle(
                                  color: isDark 
                                      ? AppColors.textSecondaryDark.withOpacity(0.4) 
                                      : AppColors.textSecondaryLight.withOpacity(0.6),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    const double spacing = 28.0;
    for (double x = 0.0; x < size.width; x += spacing) {
      for (double y = 0.0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 0.8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
