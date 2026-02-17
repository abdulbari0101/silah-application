// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'training_opportunity_entity.dart';

class TrainingOpportunityEntityMapper
    extends ClassMapperBase<TrainingOpportunityEntity> {
  TrainingOpportunityEntityMapper._();

  static TrainingOpportunityEntityMapper? _instance;
  static TrainingOpportunityEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingOpportunityEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingOpportunityEntity';

  static int? _$id(TrainingOpportunityEntity v) => v.id;
  static const Field<TrainingOpportunityEntity, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$lawyerId(TrainingOpportunityEntity v) => v.lawyerId;
  static const Field<TrainingOpportunityEntity, String> _f$lawyerId = Field(
    'lawyerId',
    _$lawyerId,
    opt: true,
  );
  static String? _$title(TrainingOpportunityEntity v) => v.title;
  static const Field<TrainingOpportunityEntity, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$description(TrainingOpportunityEntity v) => v.description;
  static const Field<TrainingOpportunityEntity, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$city(TrainingOpportunityEntity v) => v.city;
  static const Field<TrainingOpportunityEntity, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static bool _$isOpen(TrainingOpportunityEntity v) => v.isOpen;
  static const Field<TrainingOpportunityEntity, bool> _f$isOpen = Field(
    'isOpen',
    _$isOpen,
    opt: true,
    def: true,
  );
  static String? _$createdAt(TrainingOpportunityEntity v) => v.createdAt;
  static const Field<TrainingOpportunityEntity, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );

  @override
  final MappableFields<TrainingOpportunityEntity> fields = const {
    #id: _f$id,
    #lawyerId: _f$lawyerId,
    #title: _f$title,
    #description: _f$description,
    #city: _f$city,
    #isOpen: _f$isOpen,
    #createdAt: _f$createdAt,
  };
  @override
  final bool ignoreNull = true;

  static TrainingOpportunityEntity _instantiate(DecodingData data) {
    return TrainingOpportunityEntity(
      id: data.dec(_f$id),
      lawyerId: data.dec(_f$lawyerId),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      city: data.dec(_f$city),
      isOpen: data.dec(_f$isOpen),
      createdAt: data.dec(_f$createdAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingOpportunityEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrainingOpportunityEntity>(map);
  }

  static TrainingOpportunityEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<TrainingOpportunityEntity>(json);
  }
}

mixin TrainingOpportunityEntityMappable {
  String toJsonString() {
    return TrainingOpportunityEntityMapper.ensureInitialized()
        .encodeJson<TrainingOpportunityEntity>(
          this as TrainingOpportunityEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingOpportunityEntityMapper.ensureInitialized()
        .encodeMap<TrainingOpportunityEntity>(
          this as TrainingOpportunityEntity,
        );
  }

  TrainingOpportunityEntityCopyWith<
    TrainingOpportunityEntity,
    TrainingOpportunityEntity,
    TrainingOpportunityEntity
  >
  get copyWith =>
      _TrainingOpportunityEntityCopyWithImpl<
        TrainingOpportunityEntity,
        TrainingOpportunityEntity
      >(this as TrainingOpportunityEntity, $identity, $identity);
  @override
  String toString() {
    return TrainingOpportunityEntityMapper.ensureInitialized().stringifyValue(
      this as TrainingOpportunityEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return TrainingOpportunityEntityMapper.ensureInitialized().equalsValue(
      this as TrainingOpportunityEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return TrainingOpportunityEntityMapper.ensureInitialized().hashValue(
      this as TrainingOpportunityEntity,
    );
  }
}

extension TrainingOpportunityEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingOpportunityEntity, $Out> {
  TrainingOpportunityEntityCopyWith<$R, TrainingOpportunityEntity, $Out>
  get $asTrainingOpportunityEntity => $base.as(
    (v, t, t2) => _TrainingOpportunityEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TrainingOpportunityEntityCopyWith<
  $R,
  $In extends TrainingOpportunityEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? lawyerId,
    String? title,
    String? description,
    String? city,
    bool? isOpen,
    String? createdAt,
  });
  TrainingOpportunityEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TrainingOpportunityEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrainingOpportunityEntity, $Out>
    implements
        TrainingOpportunityEntityCopyWith<$R, TrainingOpportunityEntity, $Out> {
  _TrainingOpportunityEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrainingOpportunityEntity> $mapper =
      TrainingOpportunityEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? lawyerId = $none,
    Object? title = $none,
    Object? description = $none,
    Object? city = $none,
    bool? isOpen,
    Object? createdAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (lawyerId != $none) #lawyerId: lawyerId,
      if (title != $none) #title: title,
      if (description != $none) #description: description,
      if (city != $none) #city: city,
      if (isOpen != null) #isOpen: isOpen,
      if (createdAt != $none) #createdAt: createdAt,
    }),
  );
  @override
  TrainingOpportunityEntity $make(CopyWithData data) =>
      TrainingOpportunityEntity(
        id: data.get(#id, or: $value.id),
        lawyerId: data.get(#lawyerId, or: $value.lawyerId),
        title: data.get(#title, or: $value.title),
        description: data.get(#description, or: $value.description),
        city: data.get(#city, or: $value.city),
        isOpen: data.get(#isOpen, or: $value.isOpen),
        createdAt: data.get(#createdAt, or: $value.createdAt),
      );

  @override
  TrainingOpportunityEntityCopyWith<$R2, TrainingOpportunityEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingOpportunityEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

