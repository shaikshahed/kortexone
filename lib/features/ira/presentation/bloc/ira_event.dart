import 'package:equatable/equatable.dart';
import '../../domain/entities/ira_agent.dart';

abstract class IraEvent extends Equatable {
  const IraEvent();

  @override
  List<Object?> get props => [];
}

class IraLoadInitial extends IraEvent {
  const IraLoadInitial();
}

class IraSelectAgent extends IraEvent {
  final IraAgent agent;

  const IraSelectAgent(this.agent);

  @override
  List<Object?> get props => [agent];
}

class IraSendMessage extends IraEvent {
  final String text;

  const IraSendMessage(this.text);

  @override
  List<Object?> get props => [text];
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
