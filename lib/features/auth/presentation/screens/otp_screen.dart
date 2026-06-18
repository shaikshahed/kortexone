// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/di/injection.dart';
import '../bloc/otp/otp_bloc.dart';
import '../bloc/otp/otp_event.dart';
import '../bloc/otp/otp_state.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class OtpScreenArguments {
  final String email;
  final String password;
  final String maskedEmail;

  const OtpScreenArguments({
    required this.email,
    required this.password,
    required this.maskedEmail,
  });
}

class OtpScreen extends StatefulWidget {
  final String email;
  final String password;
  final String maskedEmail;

  const OtpScreen({
    super.key,
    required this.email,
    required this.password,
    required this.maskedEmail,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  late final OtpBloc _otpBloc;

  @override
  void initState() {
    super.initState();
    _otpBloc = getIt<OtpBloc>()..add(const OtpStarted());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleChanged(int index, String value) {
    if (value.length == 6) {
      for (int i = 0; i < 6; i++) {
        _controllers[i].text = value[i];
      }
      _focusNodes[5].requestFocus();
      final code = _controllers.map((c) => c.text).join();
      _otpBloc.add(OtpCodeChanged(code));
      return;
    }

    if (value.isNotEmpty) {
      if (value.length > 1) {
        _controllers[index].text = value.substring(value.length - 1);
      }
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    final code = _controllers.map((c) => c.text).join();
    _otpBloc.add(OtpCodeChanged(code));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider<OtpBloc>(
      create: (_) => _otpBloc,
      child: Scaffold(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        body: BlocListener<OtpBloc, OtpState>(
          listenWhen: (previous, current) =>
              previous.status != current.status ||
              previous.resendStatus != current.resendStatus,
          listener: (context, state) {
            if (state.status == OtpStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('OTP Verified Successfully!'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              // Notify global AuthBloc of successful login
              context.read<AuthBloc>().add(AuthCheckRequested());
              // Navigate to IRA screen and prevent back navigation
              context.go(RouteNames.ira);
            } else if (state.status == OtpStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Verification Failed. Please try again.'),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else if (state.resendStatus == ResendStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('A new OTP has been sent to your email.'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              // Clear inputs on successful resend
              for (var controller in _controllers) {
                controller.clear();
              }
              _focusNodes[0].requestFocus();
            } else if (state.resendStatus == ResendStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Failed to resend OTP. Please try again.'),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: Stack(
            children: [
              // Radial Glow Background Circles (Matching LoginScreen)
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

              // Dotted Grid Overlay
              if (isDark)
                Positioned.fill(
                  child: CustomPaint(
                    painter: DotGridPainter(),
                  ),
                ),

              // Main content
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 420),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),

                            // Brand logo header
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

                            // Glassmorphic Card Container
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Shield Icon
                                  Center(
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: isDark 
                                            ? const Color(0xFF581C87).withOpacity(0.15) 
                                            : const Color(0xFF581C87).withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: const Color(0xFFC084FC).withOpacity(0.3),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.shield_outlined,
                                        color: Color(0xFFC084FC),
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Title
                                  Text(
                                    'Verify Your Identity',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppTypography.fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Subtitle
                                  Text.rich(
                                    TextSpan(
                                      text: 'Enter the 6-digit code sent to ',
                                      children: [
                                        TextSpan(
                                          text: widget.maskedEmail,
                                          style: const TextStyle(
                                            color: AppColors.linkPurple,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppTypography.fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 32),

                                  // 6 Digit OTP Fields (Responsive via AspectRatio & Expanded)
                                  Row(
                                    children: List.generate(6, (index) {
                                      return Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: index == 0 ? 0.0 : 6.0,
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 0.85,
                                            child: Focus(
                                              onKeyEvent: (node, event) {
                                                if (event is KeyDownEvent &&
                                                    event.logicalKey == LogicalKeyboardKey.backspace) {
                                                  if (_controllers[index].text.isEmpty && index > 0) {
                                                    _focusNodes[index - 1].requestFocus();
                                                    return KeyEventResult.handled;
                                                  }
                                                }
                                                return KeyEventResult.ignored;
                                              },
                                              child: TextField(
                                                controller: _controllers[index],
                                                focusNode: _focusNodes[index],
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                maxLength: 1,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                                                ),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.digitsOnly,
                                                ],
                                                decoration: InputDecoration(
                                                  counterText: '',
                                                  filled: true,
                                                  fillColor: isDark ? AppColors.cardDark : AppColors.cardLight,
                                                  contentPadding: EdgeInsets.zero,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      color: isDark ? AppColors.inputBorderDark : Colors.black12,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: const BorderSide(
                                                      color: AppColors.primaryLight,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                onChanged: (val) => _handleChanged(index, val),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),

                                  const SizedBox(height: 32),

                                  // Submit button
                                  BlocBuilder<OtpBloc, OtpState>(
                                    builder: (context, state) {
                                      final isComplete = state.otpCode.length == 6;
                                      return PrimaryButton(
                                        text: 'Verify Code',
                                        isLoading: state.status == OtpStatus.loading,
                                        icon: const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        onPressed: isComplete
                                            ? () {
                                                _otpBloc.add(
                                                  OtpSubmitted(
                                                    email: widget.email,
                                                    password: widget.password,
                                                    otp: state.otpCode,
                                                  ),
                                                );
                                              }
                                            : null,
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 24),

                                  // Bottom Actions Row (Resend Code / Back to Login)
                                  BlocBuilder<OtpBloc, OtpState>(
                                    builder: (context, state) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Left side: Timer / Resend Code
                                          GestureDetector(
                                            onTap: state.isTimerActive || state.resendStatus == ResendStatus.loading
                                                ? null
                                                : () {
                                                    _otpBloc.add(
                                                      OtpResendRequested(
                                                        email: widget.email,
                                                        password: widget.password,
                                                      ),
                                                    );
                                                  },
                                            child: MouseRegion(
                                              cursor: state.isTimerActive
                                                  ? SystemMouseCursors.basic
                                                  : SystemMouseCursors.click,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.refresh_rounded,
                                                    size: 16,
                                                    color: state.isTimerActive
                                                        ? (isDark
                                                            ? AppColors.textSecondaryDark.withOpacity(0.35)
                                                            : AppColors.textSecondaryLight.withOpacity(0.35))
                                                        : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    state.resendStatus == ResendStatus.loading
                                                        ? "Resending..."
                                                        : (state.isTimerActive
                                                            ? "Resend in ${state.timerSeconds}s"
                                                            : "Resend Code"),
                                                    style: TextStyle(
                                                      fontFamily: AppTypography.fontFamily,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      color: state.isTimerActive
                                                          ? (isDark
                                                              ? AppColors.textSecondaryDark.withOpacity(0.35)
                                                              : AppColors.textSecondaryLight.withOpacity(0.35))
                                                          : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          // Right side: Back to Login
                                          GestureDetector(
                                            onTap: () {
                                              context.go(RouteNames.login);
                                            },
                                            child: MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_back_rounded,
                                                    size: 16,
                                                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    "Back to Login",
                                                    style: TextStyle(
                                                      fontFamily: AppTypography.fontFamily,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 48),

                            // Footer copyright
                            Center(
                              child: Text(
                                '© 2026 KortexOne. All rights reserved.',
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
            ],
          ),
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
