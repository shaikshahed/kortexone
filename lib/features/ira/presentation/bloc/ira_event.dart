import 'package:equatable/equatable.dart';
import '../../domain/entities/ira_agent.dart';
import '../../domain/entities/ira_conversation.dart';

abstract class IraEvent extends Equatable {
  const IraEvent();

  @override
  List<Object?> get props => [];
}

class IraLoadInitial extends IraEvent {
  const IraLoadInitial();
}

class IraLoadAgents extends IraEvent {
  const IraLoadAgents();
}

class IraLoadConversations extends IraEvent {
  const IraLoadConversations();
}

class IraLoadFiles extends IraEvent {
  final String agentId;

  const IraLoadFiles(this.agentId);

  @override
  List<Object?> get props => [agentId];
}

class IraSelectConversation extends IraEvent {
  final IraConversation conversation;

  const IraSelectConversation(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class IraCreateNewConversation extends IraEvent {
  const IraCreateNewConversation();
}

class IraSelectAgent extends IraEvent {
  final IraAgent agent;

  const IraSelectAgent(this.agent);

  @override
  List<Object?> get props => [agent];
}

class IraSendMessage extends IraEvent {
  final String text;
  final String? userEmail;

  const IraSendMessage(this.text, {this.userEmail});

  @override
  List<Object?> get props => [text, userEmail];
}

class IraSearchFiles extends IraEvent {
  final String query;

  const IraSearchFiles(this.query);

  @override
  List<Object?> get props => [query];
}

class IraChangeTab extends IraEvent {
  final int tabIndex; // 0 for Chats, 1 for Files

  const IraChangeTab(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
