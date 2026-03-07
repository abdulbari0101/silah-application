import 'dart:io';

class SpecificationEditorPayload {
  final String? specializationId;
  final String nameAr;
  final String nameEn;
  final int order;
  final String? currentIconUrl;
  final File? iconFile;

  const SpecificationEditorPayload({
    this.specializationId,
    required this.nameAr,
    required this.nameEn,
    required this.order,
    this.currentIconUrl,
    this.iconFile,
  });
}
