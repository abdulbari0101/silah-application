import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/media/image_services/image_picker_service.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/image_picker_sheet.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/admin/models/specification_editor_payload.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/admin/widgets/specification_editor_icon_preview.dart';

class SpecificationEditorSheet extends StatefulWidget {
  const SpecificationEditorSheet({
    super.key,
    this.initial,
    required this.onSubmit,
  });

  final LegalSpecializationEntity? initial;
  final Future<String?> Function(SpecificationEditorPayload payload) onSubmit;

  @override
  State<SpecificationEditorSheet> createState() =>
      _SpecificationEditorSheetState();
}

class _SpecificationEditorSheetState extends State<SpecificationEditorSheet> {
  late final TextEditingController _nameArController;
  late final TextEditingController _nameEnController;
  late final TextEditingController _orderController;
  File? _iconFile;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameArController = TextEditingController(text: widget.initial?.name ?? '');
    _nameEnController = TextEditingController(text: widget.initial?.code ?? '');
    _orderController = TextEditingController(
      text: widget.initial?.description ?? '',
    );
  }

  @override
  void dispose() {
    _nameArController.dispose();
    _nameEnController.dispose();
    _orderController.dispose();
    super.dispose();
  }

  bool get _isEditing => widget.initial?.id != null;

  Future<void> _pickIcon() async {
    ImageSource? source;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return ImagePickerBottomSheet(
          onSelect: (selected) {
            source = selected;
            Navigator.of(sheetContext).pop();
          },
        );
      },
    );

    if (source == null || !mounted) return;
    final file = await locator<ImagePickerService>().pickImage(source: source!);
    if (file == null || !mounted) return;
    setState(() => _iconFile = file);
  }

  Future<void> _submit() async {
    if (_isSaving) return;

    final nameAr = _nameArController.text.trim();
    final nameEn = _nameEnController.text.trim();
    final order = int.tryParse(_orderController.text.trim());

    if (nameAr.isEmpty) {
      Toasts.error(context, 'Arabic name is required');
      return;
    }
    if (nameEn.isEmpty) {
      Toasts.error(context, 'English name is required');
      return;
    }
    if (order == null || order < 0) {
      Toasts.error(context, 'Order must be a valid number');
      return;
    }

    setState(() => _isSaving = true);
    final error = await widget.onSubmit(
      SpecificationEditorPayload(
        specializationId: widget.initial?.id,
        nameAr: nameAr,
        nameEn: nameEn,
        order: order,
        currentIconUrl: widget.initial?.iconUrl,
        iconFile: _iconFile,
      ),
    );

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (error != null && error.trim().isNotEmpty) {
      Toasts.error(context, error);
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).viewInsets;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          UIConstants.mediumPadding,
          UIConstants.mediumPadding,
          UIConstants.mediumPadding,
          UIConstants.mediumPadding + insets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isEditing ? 'Edit specialization' : 'Add specialization',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              UIConstants.mediumHeight,
              Center(
                child: SpecificationEditorIconPreview(
                  file: _iconFile,
                  url: widget.initial?.iconUrl,
                ),
              ),
              Center(
                child: TextButton.icon(
                  onPressed: _isSaving ? null : _pickIcon,
                  icon: const Icon(Icons.image_outlined),
                  label: const Text('Choose icon'),
                ),
              ),
              UIConstants.smallHeight,
              TextField(
                controller: _nameArController,
                enabled: !_isSaving,
                decoration: const InputDecoration(
                  labelText: 'Arabic name',
                  hintText: 'e.g. الأحوال الشخصية',
                ),
              ),
              UIConstants.smallHeight,
              TextField(
                controller: _nameEnController,
                enabled: !_isSaving,
                decoration: const InputDecoration(
                  labelText: 'English name',
                  hintText: 'e.g. Family Law',
                ),
              ),
              UIConstants.smallHeight,
              TextField(
                controller: _orderController,
                enabled: !_isSaving,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Order',
                  hintText: 'e.g. 1',
                ),
              ),
              UIConstants.bigHeight,
              PrimaryButtonWithProgress(
                text: _isEditing ? Strings.update.tr() : Strings.save.tr(),
                onTap: _submit,
                isLoading: _isSaving,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
