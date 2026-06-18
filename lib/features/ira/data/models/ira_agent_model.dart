import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ira_agent.dart';

part 'ira_agent_model.freezed.dart';

@freezed
abstract class IraAgentModel with _$IraAgentModel {
  const factory IraAgentModel({
    required String id,
    required String name,
    required String description,
    required String status,
    required String iconPath,
  }) = _IraAgentModel;

  factory IraAgentModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? json['_id'] ?? '';
    final name = json['name'] ?? json['config_json']?['display_name'] ?? 'Assistant';
    final description = json['description'] ?? '';
    final status = (json['is_active'] == true) ? 'Active' : 'Inactive';
    final iconPath = json['icon'] ?? json['config_json']?['icon'] ?? '';

    return IraAgentModel(
      id: id,
      name: name,
      description: description,
      status: status,
      iconPath: iconPath,
    );
  }

  const IraAgentModel._();

  IraAgent toEntity() => IraAgent(
        id: id,
        name: name,
        description: description,
        status: status,
        iconPath: iconPath,
      );
}
