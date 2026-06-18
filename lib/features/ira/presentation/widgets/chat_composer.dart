// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ChatComposer extends StatefulWidget {
  final Function(String) onSend;
  final bool isSending;

  const ChatComposer({
    super.key,
    required this.onSend,
    required this.isSending,
  });

  @override
  State<ChatComposer> createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !widget.isSending) {
      widget.onSend(text);
      _controller.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.cardBorderDark : Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : AppColors.cardLight,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isDark ? AppColors.inputBorderDark : Colors.black12,
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _controller,
                      onChanged: (val) => setState(() {}),
                      onSubmitted: (_) => _handleSubmit(),
                      maxLines: 4,
                      minLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask about your documents...',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _handleSubmit,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _controller.text.trim().isEmpty || widget.isSending
                          ? null
                          : const LinearGradient(
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFFD946EF),
                              ],
                            ),
                      color: _controller.text.trim().isEmpty || widget.isSending
                          ? (isDark ? AppColors.cardDark : AppColors.cardLight)
                          : null,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.send_rounded,
                        size: 20,
                        color: _controller.text.trim().isEmpty || widget.isSending
                            ? (isDark
                                ? AppColors.textSecondaryDark.withOpacity(0.5)
                                : AppColors.textSecondaryLight.withOpacity(0.5))
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Ira can make mistakes. Verify critical information with source documents.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.textSecondaryDark.withOpacity(0.6) : AppColors.textSecondaryLight.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
