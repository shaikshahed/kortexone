import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ira_file.dart';

part 'ira_file_model.freezed.dart';

@freezed
abstract class IraFileModel with _$IraFileModel {
  const factory IraFileModel({
    required String id,
    required String agentId,
    required String name,
    required String extension,
    required String sizeString,
  }) = _IraFileModel;

  factory IraFileModel.fromJson(Map<String, dynamic> json) {
    // Determine the name
    String name = json['name'] ?? json['file_name'] ?? json['filename'] ?? json['original_name'] ?? json['original_filename'] ?? '';
    if (name.isEmpty && json['extracted_text'] != null) {
      final text = json['extracted_text'] as String;
      final lines = text.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty && !l.startsWith('---')).toList();
      if (lines.isNotEmpty) {
        name = lines.first;
        if (name.length > 50) {
          name = '${name.substring(0, 47)}...';
        }
      }
    }
    if (name.isEmpty) {
      name = 'document';
    }

    // Determine extension
    String ext = json['extension'] ?? json['document_type'] ?? 'pdf';
    if (!name.contains('.') && ext.isNotEmpty) {
      name = '$name.$ext';
    }

    // Determine id
    final id = json['id'] ?? json['_id'] ?? json['document_id'] ?? DateTime.now().millisecondsSinceEpoch.toString();

    // Determine sizeString
    final sizeString = json['sizeString'] ?? json['size'] ?? json['file_size'] ?? '1.2 MB';

    // Determine agentId
    final assistantIdsList = json['assistant_ids'];
    String agentId = '';
    if (assistantIdsList is List && assistantIdsList.isNotEmpty) {
      agentId = assistantIdsList.first.toString();
    }

    return IraFileModel(
      id: id,
      agentId: agentId,
      name: name,
      extension: ext,
      sizeString: sizeString,
    );
  }

  const IraFileModel._();

  IraFile toEntity() => IraFile(
        id: id,
        agentId: agentId,
        name: name,
        extension: extension,
        sizeString: sizeString,
      );
}
