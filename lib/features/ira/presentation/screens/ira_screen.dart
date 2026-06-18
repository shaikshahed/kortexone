// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/di/injection.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../auth/presentation/widgets/logout_confirmation_dialog.dart';
import '../bloc/ira_bloc.dart';
import '../bloc/ira_event.dart';
import '../bloc/ira_state.dart';
import '../../domain/entities/ira_agent.dart';
import '../widgets/chat_view.dart';
import '../widgets/files_view.dart';
import '../widgets/chat_composer.dart';

class ChatGPTMenuIcon extends StatelessWidget {
  final Color color;
  const ChatGPTMenuIcon({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 18,
          height: 2.2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 12,
          height: 2.2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}

class IraScreen extends StatefulWidget {
  const IraScreen({super.key});

  @override
  State<IraScreen> createState() => _IraScreenState();
}

class _IraScreenState extends State<IraScreen> {
  bool _isSidebarOpen = false;
  int _sidebarTabIndex = 0; // 0 for History, 1 for Files

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              context.go(RouteNames.login);
            }
          },
        ),
      ],
      child: BlocProvider<IraBloc>(
        create: (_) => getIt<IraBloc>()..add(const IraLoadInitial()),
        child: Scaffold(
          backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          body: BlocBuilder<IraBloc, IraState>(
            builder: (context, state) {
              if (state.status == IraStatus.initial ||
                  (state.status == IraStatus.loading && state.selectedAgent == null)) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }

              if (state.status == IraStatus.failure && state.selectedAgent == null) {
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
                          state.errorMessage ?? 'Failed to load IRA configuration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<IraBloc>().add(const IraLoadInitial());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Stack(
                children: [
                  // Main Content Layer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header App Bar
                      SafeArea(
                        bottom: false,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.surfaceDark : Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: isDark ? AppColors.cardBorderDark : Colors.black12,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // 3 Lines Offset Menu Icon
                              IconButton(
                                icon: ChatGPTMenuIcon(
                                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isSidebarOpen = !_isSidebarOpen;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              // Active Agent Name
                              if (state.selectedAgent != null) ...[
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
                                const SizedBox(width: 10),
                                Text(
                                  state.selectedAgent!.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  'IRA Assistant',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                  ),
                                ),
                              ],
                              const Spacer(),
                              // Notifications
                              IconButton(
                                icon: Icon(
                                  Icons.notifications_none_rounded,
                                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                ),
                                onPressed: () {},
                              ),
                              // Logout
                              IconButton(
                                icon: const Icon(Icons.logout_rounded),
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) => const LogoutConfirmationDialog(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chat Conversation Body
                      Expanded(
                        child: ChatView(
                          messages: state.messages,
                          welcomeMessage: state.welcomeMessage,
                          isSending: state.isSending,
                          status: state.status,
                          suggestions: state.suggestions,
                          suggestionsStatus: state.suggestionsStatus,
                          onRetry: () {
                            if (state.selectedAgent != null) {
                              context.read<IraBloc>().add(IraSelectAgent(state.selectedAgent!));
                            }
                          },
                        ),
                      ),

                      // Bottom Composer
                      if (state.selectedAgent != null)
                        ChatComposer(
                          isSending: state.isSending,
                          onSend: (text) {
                            context.read<IraBloc>().add(IraSendMessage(text));
                          },
                        ),
                    ],
                  ),

                  // Dim overlay when sidebar is open
                  if (_isSidebarOpen)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSidebarOpen = false;
                          });
                        },
                        child: Container(
                          color: Colors.black.withOpacity(isDark ? 0.6 : 0.35),
                        ),
                      ),
                    ),

                  // Left Sliding Drawer Container
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeInOut,
                    left: _isSidebarOpen ? 0 : -280,
                    top: 0,
                    bottom: 0,
                    width: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.surfaceDark : Colors.white,
                        border: Border(
                          right: BorderSide(
                            color: isDark ? AppColors.cardBorderDark : Colors.black12,
                            width: 1.0,
                          ),
                        ),
                        boxShadow: _isSidebarOpen
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(isDark ? 0.5 : 0.15),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Sidebar Header
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: ChatGPTMenuIcon(
                                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isSidebarOpen = false;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'KortexOne IRA',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.2,
                                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Column Navigation Links (History & Files)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  _buildNavigationRow(
                                    icon: Icons.chat_bubble_outline_rounded,
                                    label: 'History',
                                    isActive: _sidebarTabIndex == 0,
                                    isDark: isDark,
                                    onTap: () {
                                      setState(() {
                                        _sidebarTabIndex = 0;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  _buildNavigationRow(
                                    icon: Icons.description_outlined,
                                    label: 'Files',
                                    isActive: _sidebarTabIndex == 1,
                                    isDark: isDark,
                                    onTap: () {
                                      setState(() {
                                        _sidebarTabIndex = 1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Divider(
                              color: isDark ? AppColors.cardBorderDark : Colors.black12,
                              height: 1,
                            ),
                            const SizedBox(height: 16),

                            // Dynamic Listing Area (History list or Files list)
                            Expanded(
                              child: _sidebarTabIndex == 0
                                  ? _buildHistoryList(state.agents, state.selectedAgent, context, isDark)
                                  : FilesView(files: state.filteredFiles),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationRow({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? (isDark ? AppColors.cardDark : AppColors.cardLight)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive
                  ? AppColors.primaryLight
                  : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: isActive
                    ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
                    : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList(
    List<IraAgent> agents,
    IraAgent? selectedAgent,
    BuildContext context,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RECENTS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: agents.length,
              itemBuilder: (context, index) {
                final agent = agents[index];
                final isSelected = selectedAgent?.id == agent.id;
                return _buildAgentListTile(agent, isSelected, context, isDark);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgentListTile(
    IraAgent agent,
    bool isSelected,
    BuildContext context,
    bool isDark,
  ) {
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

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? (isDark ? AppColors.cardDark.withOpacity(0.6) : AppColors.cardLight)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? (isDark ? AppColors.cardBorderDark : Colors.black12)
              : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        leading: Builder(
          builder: (context) {
            Widget iconWidget;
            if (agent.iconPath.startsWith('data:image/') && agent.iconPath.contains('base64,')) {
              try {
                final base64Str = agent.iconPath.split('base64,').last.trim();
                final decodedBytes = base64Decode(base64Str);
                iconWidget = Image.memory(
                  decodedBytes,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                );
              } catch (e) {
                iconWidget = Icon(iconData, color: iconColor, size: 18);
              }
            } else if (agent.iconPath.isNotEmpty && !agent.iconPath.contains('/') && !agent.iconPath.contains('.') && agent.iconPath.length <= 4) {
              iconWidget = Text(
                agent.iconPath,
                style: const TextStyle(fontSize: 16),
              );
            } else {
              iconWidget = Icon(iconData, color: iconColor, size: 18);
            }

            return Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(isDark ? 0.15 : 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: iconWidget,
            );
          }
        ),
        title: Text(
          agent.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        trailing: agent.status.toLowerCase() == 'active'
            ? Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        onTap: () {
          context.read<IraBloc>().add(IraSelectAgent(agent));
          setState(() {
            _isSidebarOpen = false;
          });
        },
      ),
    );
  }
}
