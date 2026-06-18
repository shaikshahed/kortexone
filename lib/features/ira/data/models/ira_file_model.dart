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
    String name = (json['name'] ?? json['file_name'] ?? json['filename'] ?? json['original_name'] ?? json['original_filename'] ?? '').toString();
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
    String ext = (json['extension'] ?? json['document_type'] ?? 'pdf').toString();
    if (!name.contains('.') && ext.isNotEmpty) {
      name = '$name.$ext';
    }

    // Determine id
    final id = (json['id'] ?? json['_id'] ?? json['document_id'] ?? DateTime.now().millisecondsSinceEpoch).toString();

    // Determine sizeString
    String sizeString = '1.2 MB';
    if (json['sizeString'] != null) {
      sizeString = json['sizeString'].toString();
    } else if (json['size'] != null) {
      sizeString = _formatFileSize(json['size']);
    } else if (json['file_size'] != null) {
      sizeString = _formatFileSize(json['file_size']);
    }

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

  static String _formatFileSize(dynamic size) {
    if (size == null) return '1.2 MB';
    try {
      final bytes = int.tryParse(size.toString());
      if (bytes == null) return size.toString();
      if (bytes < 1024) return '$bytes B';
      if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } catch (_) {
      return size.toString();
    }
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
