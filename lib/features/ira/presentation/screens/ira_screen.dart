// ignore_for_file: deprecated_member_use

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
import '../../domain/entities/ira_conversation.dart';
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
                                  if (_isSidebarOpen) {
                                    context.read<IraBloc>().add(const IraLoadAgents());
                                  }
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
                          messagesStatus: state.messagesStatus,
                          suggestions: state.suggestions,
                          suggestionsStatus: state.suggestionsStatus,
                          liveConnectors: state.liveConnectors,
                          onRetry: () {
                            if (state.selectedConversation != null) {
                              context.read<IraBloc>().add(IraSelectConversation(state.selectedConversation!));
                            } else if (state.selectedAgent != null) {
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
                            final authState = context.read<AuthBloc>().state;
                            final email = authState is AuthAuthenticated ? authState.user.email : null;
                            context.read<IraBloc>().add(IraSendMessage(text, userEmail: email));
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
                            const SizedBox(height: 8),

                            // Agent Selector
                            _buildAgentSelector(state.agents, state.selectedAgent, context, isDark),

                            // CHATS / FILES Tabs
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.04),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _sidebarTabIndex = 0;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          decoration: BoxDecoration(
                                            color: _sidebarTabIndex == 0
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'CHATS',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: _sidebarTabIndex == 0
                                                  ? Colors.white
                                                  : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _sidebarTabIndex = 1;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          decoration: BoxDecoration(
                                            color: _sidebarTabIndex == 1
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'FILES',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: _sidebarTabIndex == 1
                                                      ? Colors.white
                                                      : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                                                ),
                                              ),
                                              if (state.files.isNotEmpty) ...[
                                                const SizedBox(width: 6),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: _sidebarTabIndex == 1
                                                        ? (isDark ? const Color(0xFF581C87) : const Color(0xFFC084FC).withOpacity(0.3))
                                                        : (isDark ? const Color(0xFF3B0764) : const Color(0xFFF3E8FF)),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Text(
                                                    '${state.files.length}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: _sidebarTabIndex == 1
                                                          ? Colors.white
                                                          : (isDark ? const Color(0xFFD8B4FE) : AppColors.primary),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              color: isDark ? AppColors.cardBorderDark : Colors.black12,
                              height: 1,
                            ),
                            const SizedBox(height: 8),

                            // Dynamic Listing Area (History list or Files list)
                            Expanded(
                              child: _sidebarTabIndex == 0
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        _buildNewConversationButton(context, isDark),
                                        Expanded(
                                          child: _buildHistoryList(state.conversations, state.selectedConversation, context, isDark),
                                        ),
                                      ],
                                    )
                                  : FilesView(
                                      files: state.filteredFiles,
                                      filesStatus: state.filesStatus,
                                      onRetry: () {
                                        final agentId = state.selectedAgent?.id ?? '6a2d2459063374a0a19554e7';
                                        context.read<IraBloc>().add(
                                              IraLoadFiles(agentId),
                                            );
                                      },
                                    ),
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

  Widget _buildAgentSelector(
    List<IraAgent> agents,
    IraAgent? selectedAgent,
    BuildContext context,
    bool isDark,
  ) {
    if (agents.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'AGENTS',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: agents.length,
            itemBuilder: (context, index) {
              final agent = agents[index];
              final isSelected = selectedAgent?.id == agent.id;

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

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(
                    agent.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Colors.white
                          : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                    ),
                  ),
                  avatar: Icon(
                    iconData,
                    size: 14,
                    color: isSelected ? Colors.white : iconColor,
                  ),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  backgroundColor: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.04),
                  onSelected: (selected) {
                    if (selected) {
                      context.read<IraBloc>().add(IraSelectAgent(agent));
                    }
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildNewConversationButton(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<IraBloc>().add(const IraCreateNewConversation());
          setState(() {
            _isSidebarOpen = false;
          });
        },
        icon: const Icon(Icons.add, size: 18),
        label: const Text(
          'New Conversation',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList(
    List<IraConversation> conversations,
    IraConversation? selectedConversation,
    BuildContext context,
    bool isDark,
  ) {
    if (conversations.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline_rounded,
                size: 32,
                color: isDark ? Colors.white38 : Colors.black38,
              ),
              const SizedBox(height: 12),
              Text(
                'No conversations yet',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HISTORY',
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
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                final isSelected = selectedConversation?.id == conversation.id;
                return _buildConversationListTile(conversation, isSelected, context, isDark);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversationListTile(
    IraConversation conversation,
    bool isSelected,
    BuildContext context,
    bool isDark,
  ) {
    String timeStr = '';
    try {
      final now = DateTime.now();
      final diff = now.difference(conversation.updatedAt);
      if (diff.inDays == 0) {
        timeStr = '${conversation.updatedAt.hour.toString().padLeft(2, '0')}:${conversation.updatedAt.minute.toString().padLeft(2, '0')}';
      } else if (diff.inDays == 1) {
        timeStr = 'Yesterday';
      } else {
        final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        timeStr = '${conversation.updatedAt.day} ${months[conversation.updatedAt.month - 1]}';
      }
    } catch (e) {
      timeStr = '';
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        title: Text(
          conversation.title.isNotEmpty ? conversation.title : 'Untitled Conversation',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            color: isSelected
                ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
                : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
          ),
        ),
        subtitle: timeStr.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  timeStr,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? Colors.white30 : Colors.black38,
                  ),
                ),
              )
            : null,
        leading: Icon(
          Icons.chat_bubble_outline_rounded,
          size: 16,
          color: isSelected
              ? AppColors.primary
              : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
        ),
        onTap: () {
          context.read<IraBloc>().add(IraSelectConversation(conversation));
          setState(() {
            _isSidebarOpen = false;
          });
        },
      ),
    );
  }
}
