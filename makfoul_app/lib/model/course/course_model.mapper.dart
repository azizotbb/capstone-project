// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'course_model.dart';

class CourseModelMapper extends ClassMapperBase<CourseModel> {
  CourseModelMapper._();

  static CourseModelMapper? _instance;
  static CourseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CourseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CourseModel';

  static int _$id(CourseModel v) => v.id;
  static const Field<CourseModel, int> _f$id = Field('id', _$id);
  static String _$tid(CourseModel v) => v.tid;
  static const Field<CourseModel, String> _f$tid = Field('tid', _$tid);
  static String _$category(CourseModel v) => v.category;
  static const Field<CourseModel, String> _f$category =
      Field('category', _$category);
  static String _$title(CourseModel v) => v.title;
  static const Field<CourseModel, String> _f$title = Field('title', _$title);
  static String _$description(CourseModel v) => v.description;
  static const Field<CourseModel, String> _f$description =
      Field('description', _$description);
  static double _$price(CourseModel v) => v.price;
  static const Field<CourseModel, double> _f$price = Field('price', _$price);
  static int _$numberOfTrainees(CourseModel v) => v.numberOfTrainees;
  static const Field<CourseModel, int> _f$numberOfTrainees =
      Field('numberOfTrainees', _$numberOfTrainees, key: r'number_of_trainees');
  static String _$startDate(CourseModel v) => v.startDate;
  static const Field<CourseModel, String> _f$startDate =
      Field('startDate', _$startDate);
  static String _$endDate(CourseModel v) => v.endDate;
  static const Field<CourseModel, String> _f$endDate =
      Field('endDate', _$endDate);
  static String _$image(CourseModel v) => v.image;
  static const Field<CourseModel, String> _f$image = Field('image', _$image);
  static String _$location(CourseModel v) => v.location;
  static const Field<CourseModel, String> _f$location =
      Field('location', _$location);
  static String _$state(CourseModel v) => v.state;
  static const Field<CourseModel, String> _f$state = Field('state', _$state);
  static String _$createdAt(CourseModel v) => v.createdAt;
  static const Field<CourseModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');

  @override
  final MappableFields<CourseModel> fields = const {
    #id: _f$id,
    #tid: _f$tid,
    #category: _f$category,
    #title: _f$title,
    #description: _f$description,
    #price: _f$price,
    #numberOfTrainees: _f$numberOfTrainees,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #image: _f$image,
    #location: _f$location,
    #state: _f$state,
    #createdAt: _f$createdAt,
  };

  static CourseModel _instantiate(DecodingData data) {
    return CourseModel(
        id: data.dec(_f$id),
        tid: data.dec(_f$tid),
        category: data.dec(_f$category),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        price: data.dec(_f$price),
        numberOfTrainees: data.dec(_f$numberOfTrainees),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        image: data.dec(_f$image),
        location: data.dec(_f$location),
        state: data.dec(_f$state),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static CourseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CourseModel>(map);
  }

  static CourseModel fromJson(String json) {
    return ensureInitialized().decodeJson<CourseModel>(json);
  }
}

mixin CourseModelMappable {
  String toJson() {
    return CourseModelMapper.ensureInitialized()
        .encodeJson<CourseModel>(this as CourseModel);
  }

  Map<String, dynamic> toMap() {
    return CourseModelMapper.ensureInitialized()
        .encodeMap<CourseModel>(this as CourseModel);
  }

  CourseModelCopyWith<CourseModel, CourseModel, CourseModel> get copyWith =>
      _CourseModelCopyWithImpl<CourseModel, CourseModel>(
          this as CourseModel, $identity, $identity);
  @override
  String toString() {
    return CourseModelMapper.ensureInitialized()
        .stringifyValue(this as CourseModel);
  }

  @override
  bool operator ==(Object other) {
    return CourseModelMapper.ensureInitialized()
        .equalsValue(this as CourseModel, other);
  }

  @override
  int get hashCode {
    return CourseModelMapper.ensureInitialized().hashValue(this as CourseModel);
  }
}

extension CourseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CourseModel, $Out> {
  CourseModelCopyWith<$R, CourseModel, $Out> get $asCourseModel =>
      $base.as((v, t, t2) => _CourseModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CourseModelCopyWith<$R, $In extends CourseModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? tid,
      String? category,
      String? title,
      String? description,
      double? price,
      int? numberOfTrainees,
      String? startDate,
      String? endDate,
      String? image,
      String? location,
      String? state,
      String? createdAt});
  CourseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CourseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CourseModel, $Out>
    implements CourseModelCopyWith<$R, CourseModel, $Out> {
  _CourseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CourseModel> $mapper =
      CourseModelMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? tid,
          String? category,
          String? title,
          String? description,
          double? price,
          int? numberOfTrainees,
          String? startDate,
          String? endDate,
          String? image,
          String? location,
          String? state,
          String? createdAt}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (tid != null) #tid: tid,
        if (category != null) #category: category,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (price != null) #price: price,
        if (numberOfTrainees != null) #numberOfTrainees: numberOfTrainees,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (image != null) #image: image,
        if (location != null) #location: location,
        if (state != null) #state: state,
        if (createdAt != null) #createdAt: createdAt
      }));
  @override
  CourseModel $make(CopyWithData data) => CourseModel(
      id: data.get(#id, or: $value.id),
      tid: data.get(#tid, or: $value.tid),
      category: data.get(#category, or: $value.category),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      price: data.get(#price, or: $value.price),
      numberOfTrainees:
          data.get(#numberOfTrainees, or: $value.numberOfTrainees),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      image: data.get(#image, or: $value.image),
      location: data.get(#location, or: $value.location),
      state: data.get(#state, or: $value.state),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  CourseModelCopyWith<$R2, CourseModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CourseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
