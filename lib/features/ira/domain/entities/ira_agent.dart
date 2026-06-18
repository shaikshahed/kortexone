import 'package:equatable/equatable.dart';

class IraAgent extends Equatable {
  final String id;
  final String name;
  final String description;
  final String status;
  final String iconPath;

  const IraAgent({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.iconPath,
  });

  @override
  List<Object?> get props => [id, name, description, status, iconPath];
}
