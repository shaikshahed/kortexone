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
  final IraStatus messagesStatus;
  final VoidCallback onRetry;
  final List<String> suggestions;
  final IraStatus suggestionsStatus;
  final List<String> liveConnectors;

  const ChatView({
    super.key,
    required this.messages,
    required this.welcomeMessage,
    required this.isSending,
    required this.status,
    required this.messagesStatus,
    required this.onRetry,
    required this.suggestions,
    required this.suggestionsStatus,
    required this.liveConnectors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (status == IraStatus.loading || messagesStatus == IraStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    if (status == IraStatus.failure || messagesStatus == IraStatus.failure) {
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
                'Failed to load conversation messages',
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

        return _buildMessageBubble(context, message, isUser, isDark);
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
                // _buildConnectorsArea(context, isDark),
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
            final authState = context.read<AuthBloc>().state;
            final email = authState is AuthAuthenticated ? authState.user.email : null;
            context.read<IraBloc>().add(IraSendMessage(suggestion, userEmail: email));
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

  Widget _buildMessageBubble(BuildContext context, IraMessage message, bool isUser, bool isDark) {
    final timeStr = "${message.timestamp.hour.toString().padLeft(2, '0')}:${message.timestamp.minute.toString().padLeft(2, '0')}";

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isUser) ...[
                // Assistant Avatar
                Container(
                  margin: const EdgeInsets.only(right: 8, top: 4),
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFFD946EF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B5CF6).withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.psychology_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4),
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
              ),
            ],
          ),
          
          // Under bubble metadata/timestamp
          Padding(
            padding: EdgeInsets.only(
              left: isUser ? 0 : 36,
              right: isUser ? 4 : 0,
              bottom: 12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timeStr,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                if (!isUser) ...[
                  const SizedBox(width: 6),
                  Text(
                    '•',
                    style: TextStyle(
                      fontSize: 10,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.auto_awesome_rounded,
                    size: 10,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    message.responseTimeMs != null
                        ? 'Response Time: ${(message.responseTimeMs! / 1000).toStringAsFixed(2)}s'
                        : 'Response Time: 3.0s', // Fallback default
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Suggestion questions chips under the last assistant message
          if (!isUser && message.suggestions != null && message.suggestions!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(left: 36, bottom: 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: message.suggestions!.map((suggestion) {
                  return GestureDetector(
                    onTap: () {
                      final authState = context.read<AuthBloc>().state;
                      final email = authState is AuthAuthenticated ? authState.user.email : null;
                      context.read<IraBloc>().add(IraSendMessage(suggestion, userEmail: email));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark 
                            ? Colors.white.withOpacity(0.04) 
                            : Colors.black.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark 
                              ? AppColors.cardBorderDark 
                              : Colors.black.withOpacity(0.06),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        suggestion,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark 
                              ? Colors.white.withOpacity(0.9) 
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(bool isDark) {
    return IraLoadingIndicator(isDark: isDark);
  }

  Widget _buildConnectorsArea(BuildContext context, bool isDark) {
    if (liveConnectors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF10B981),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'ACTIVE CONNECTORS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: liveConnectors.map((connector) {
            IconData iconData;
            Color iconColor;

            switch (connector.toLowerCase()) {
              case 'slack':
                iconData = Icons.message_outlined;
                iconColor = const Color(0xFF4A154B);
                break;
              case 'google drive':
              case 'google_drive':
              case 'gdrive':
                iconData = Icons.add_to_drive_outlined;
                iconColor = const Color(0xFF34A853);
                break;
              case 'jira':
                iconData = Icons.assignment_turned_in_outlined;
                iconColor = const Color(0xFF0052CC);
                break;
              case 'github':
                iconData = Icons.code_rounded;
                iconColor = isDark ? Colors.white : Colors.black;
                break;
              case 'gmail':
                iconData = Icons.email_outlined;
                iconColor = const Color(0xFFEA4335);
                break;
              default:
                iconData = Icons.hub_outlined;
                iconColor = const Color(0xFF8B5CF6);
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.04)
                    : Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? AppColors.cardBorderDark
                      : Colors.black.withOpacity(0.06),
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 16,
                    color: iconColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    connector,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? Colors.white.withOpacity(0.85)
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class IraLoadingIndicator extends StatefulWidget {
  final bool isDark;
  const IraLoadingIndicator({super.key, required this.isDark});

  @override
  State<IraLoadingIndicator> createState() => _IraLoadingIndicatorState();
}

class _IraLoadingIndicatorState extends State<IraLoadingIndicator> {
  String _loadingText = "Understanding your question ...";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _loadingText = "Generating response ...";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Assistant Avatar
            Container(
              margin: const EdgeInsets.only(right: 8, top: 4),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8B5CF6),
                    Color(0xFFD946EF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B5CF6).withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.psychology_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 290),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: widget.isDark ? AppColors.surfaceDark : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: widget.isDark ? AppColors.cardBorderDark : Colors.black12,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        _loadingText,
                        key: ValueKey<String>(_loadingText),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: widget.isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: const LinearProgressIndicator(
                        minHeight: 3,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
