// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/ira_file.dart';
import '../bloc/ira_bloc.dart';
import '../bloc/ira_event.dart';

class FilesView extends StatefulWidget {
  final List<IraFile> files;

  const FilesView({
    super.key,
    required this.files,
  });

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Input Bar
          TextField(
            controller: _searchController,
            onChanged: (val) {
              context.read<IraBloc>().add(IraSearchFiles(val));
            },
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            decoration: InputDecoration(
              hintText: 'Search files...',
              hintStyle: TextStyle(
                fontSize: 14,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                size: 20,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_rounded, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        context.read<IraBloc>().add(const IraSearchFiles(''));
                        setState(() {});
                      },
                    )
                  : null,
              filled: true,
              fillColor: isDark ? AppColors.cardDark : AppColors.cardLight,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.cardBorderDark : Colors.black12,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Header title
          Text(
            'KNOWLEDGE BASE',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 12),

          // Files list
          Expanded(
            child: widget.files.isEmpty
                ? _buildEmptyState(isDark)
                : ListView.builder(
                    itemCount: widget.files.length,
                    itemBuilder: (context, index) {
                      final file = widget.files[index];
                      return _buildFileItem(file, isDark);
                    },
                  ),
          ),

          // Bottom advice card
          const SizedBox(height: 12),
          _buildInfoCard(isDark),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_off_outlined,
            size: 48,
            color: isDark ? AppColors.textSecondaryDark.withOpacity(0.5) : AppColors.textSecondaryLight.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'No matching files found',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem(IraFile file, bool isDark) {
    IconData iconData;
    Color iconColor;

    switch (file.extension.toLowerCase()) {
      case 'pdf':
        iconData = Icons.picture_as_pdf_outlined;
        iconColor = Colors.redAccent;
        break;
      case 'docx':
      case 'doc':
        iconData = Icons.description_outlined;
        iconColor = Colors.blueAccent;
        break;
      case 'xlsx':
      case 'xls':
        iconData = Icons.table_chart_outlined;
        iconColor = Colors.green;
        break;
      default:
        iconData = Icons.insert_drive_file_outlined;
        iconColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark.withOpacity(0.5) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.cardBorderDark : Colors.black12,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 24,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  file.sizeString,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: Icon(
              Icons.download_rounded,
              size: 20,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Downloading ${file.name}...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark 
            ? const Color(0xFF581C87).withOpacity(0.12)
            : const Color(0xFFC084FC).withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? const Color(0xFF581C87).withOpacity(0.3)
              : const Color(0xFFC084FC).withOpacity(0.25),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: isDark ? const Color(0xFFD8B4FE) : AppColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Add more files in Document Management to extend Ira's knowledge.",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.35,
                color: isDark ? const Color(0xFFD8B4FE) : AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
