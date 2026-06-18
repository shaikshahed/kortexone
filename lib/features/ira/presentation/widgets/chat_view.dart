import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../domain/entities/ira_message.dart';
import '../bloc/ira_state.dart';
import '../bloc/ira_bloc.dart';
import '../bloc/ira_event.dart';

class ChatView extends StatelessWidget {
  final List<IraMessage> messages;
  final String welcomeMessage;
  final bool isSending;
  final IraStatus status;
  final VoidCallback onRetry;
  final List<String> suggestions;
  final IraStatus suggestionsStatus;

  const ChatView({
    super.key,
    required this.messages,
    required this.welcomeMessage,
    required this.isSending,
    required this.status,
    required this.onRetry,
    required this.suggestions,
    required this.suggestionsStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (status == IraStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    if (status == IraStatus.failure) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load chat history',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (messages.isEmpty) {
      // Welcome screen empty state
      return _buildWelcomeView(context, isDark);
    }

    // Scrollable message history list
    final reversedMessages = messages.reversed.toList();
    final itemCount = reversedMessages.length + (isSending ? 1 : 0);

    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (isSending && index == 0) {
          return _buildTypingIndicator(isDark);
        }

        final msgIndex = isSending ? index - 1 : index;
        final message = reversedMessages[msgIndex];
        final isUser = message.sender == MessageSender.user;

        return _buildMessageBubble(message, isUser, isDark);
      },
    );
  }

  Widget _buildWelcomeView(BuildContext context, bool isDark) {
    String userName = 'User';
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      userName = authState.user.name;
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        // Center radial purple glow
        if (isDark)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.6,
                  colors: [
                    const Color(0xFF6B21A8).withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Neural glowing face logo
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFFD946EF),
                        Color(0xFF3B82F6),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B5CF6).withOpacity(0.35),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? AppColors.backgroundDark : Colors.white,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.psychology_rounded,
                          size: 44,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Welcome user name text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      fontFamily: theme.textTheme.titleLarge?.fontFamily,
                    ),
                    children: [
                      TextSpan(
                        text: 'Welcome back, ',
                        style: TextStyle(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      TextSpan(
                        text: userName,
                        style: const TextStyle(
                          color: AppColors.linkPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle/Scope explanation
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 290),
                  child: Text(
                    welcomeMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.45,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSuggestionsArea(context, isDark),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionsArea(BuildContext context, bool isDark) {
    if (suggestionsStatus == IraStatus.loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.primary,
          ),
        ),
      );
    }

    if (suggestionsStatus == IraStatus.failure) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Failed to load suggestions',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded, size: 16),
            label: const Text(
              'Retry Suggestions',
              style: TextStyle(fontSize: 12),
            ),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
          ),
        ],
      );
    }

    if (suggestions.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? AppColors.cardBorderDark : Colors.black12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline_rounded,
              size: 16,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            const SizedBox(width: 8),
            Text(
              'No previous chats. Start the conversation!',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: suggestions.map((suggestion) {
        return GestureDetector(
          onTap: () {
            context.read<IraBloc>().add(IraSendMessage(suggestion));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: isDark 
                  ? Colors.white.withOpacity(0.04) 
                  : Colors.black.withOpacity(0.04),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark 
                    ? AppColors.cardBorderDark 
                    : Colors.black.withOpacity(0.08),
                width: 1.0,
              ),
            ),
            child: Text(
              suggestion,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isDark 
                    ? Colors.white.withOpacity(0.9) 
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMessageBubble(IraMessage message, bool isUser, bool isDark) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(maxWidth: 290),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primary
              : (isDark ? AppColors.surfaceDark : Colors.white),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
          border: isUser
              ? null
              : Border.all(
                  color: isDark ? AppColors.cardBorderDark : Colors.black12,
                  width: 1.0,
                ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            fontWeight: FontWeight.w500,
            color: isUser 
                ? Colors.white 
                : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(bool isDark) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(
            color: isDark ? AppColors.cardBorderDark : Colors.black12,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(0),
            const SizedBox(width: 4),
            _buildDot(1),
            const SizedBox(width: 4),
            _buildDot(2),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + (index * 150)),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -value * 3),
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
