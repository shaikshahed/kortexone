// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/ira_agent.dart';

class AgentCard extends StatelessWidget {
  final IraAgent agent;
  final bool isSelected;
  final VoidCallback onTap;

  const AgentCard({
    super.key,
    required this.agent,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    IconData iconData;
    Color iconColor;

    switch (agent.name.toLowerCase()) {
      case 'hrms':
        iconData = Icons.people_outline_rounded;
        iconColor = AppColors.logoCyan;
        break;
      case 'expense':
        iconData = Icons.receipt_long_outlined;
        iconColor = AppColors.logoIndigo;
        break;
      case 'leave':
        iconData = Icons.calendar_today_outlined;
        iconColor = AppColors.logoAmber;
        break;
      case 'payroll':
        iconData = Icons.payments_outlined;
        iconColor = AppColors.success;
        break;
      default:
        iconData = Icons.assistant_rounded;
        iconColor = AppColors.primaryLight;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? AppColors.surfaceDark : Colors.white)
              : (isDark ? AppColors.cardDark.withOpacity(0.4) : AppColors.cardLight.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? AppColors.cardBorderDark : Colors.black12),
            width: isSelected ? 1.8 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(isDark ? 0.35 : 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    Widget iconWidget;
                    if (agent.iconPath.startsWith('data:image/') && agent.iconPath.contains('base64,')) {
                      try {
                        final base64Str = agent.iconPath.split('base64,').last.trim();
                        final decodedBytes = base64Decode(base64Str);
                        iconWidget = Image.memory(
                          decodedBytes,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        );
                      } catch (e) {
                        iconWidget = Icon(iconData, color: iconColor, size: 20);
                      }
                    } else if (agent.iconPath.isNotEmpty && !agent.iconPath.contains('/') && !agent.iconPath.contains('.') && agent.iconPath.length <= 4) {
                      iconWidget = Text(
                        agent.iconPath,
                        style: const TextStyle(fontSize: 18),
                      );
                    } else {
                      iconWidget = Icon(iconData, color: iconColor, size: 20);
                    }

                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(isDark ? 0.15 : 0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: iconColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: iconWidget,
                    );
                  }
                ),
                if (agent.status.toLowerCase() == 'active')
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.success,
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              agent.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              agent.status,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
