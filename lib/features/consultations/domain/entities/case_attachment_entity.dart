import 'package:dart_mappable/dart_mappable.dart';

part 'case_attachment_entity.mapper.dart';

@MappableClass()
class CaseAttachmentEntity with CaseAttachmentEntityMappable {
  final int? id;
  final String? url;
  final String? fileName;
  final String? mimeType;
  final int? sizeBytes;

  const CaseAttachmentEntity({
    this.id,
    this.url,
    this.fileName,
    this.mimeType,
    this.sizeBytes,
  });
}
