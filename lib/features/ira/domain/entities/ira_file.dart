import 'package:equatable/equatable.dart';

class IraFile extends Equatable {
  final String id;
  final String agentId;
  final String name;
  final String extension;
  final String sizeString;

  const IraFile({
    required this.id,
    required this.agentId,
    required this.name,
    required this.extension,
    required this.sizeString,
  });

  @override
  List<Object?> get props => [id, agentId, name, extension, sizeString];
}
