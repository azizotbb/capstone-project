// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_model.dart';

class OrderModelMapper extends ClassMapperBase<OrderModel> {
  OrderModelMapper._();

  static OrderModelMapper? _instance;
  static OrderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderModelMapper._());
      CourseModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderModel';

  static int? _$id(OrderModel v) => v.id;
  static const Field<OrderModel, int> _f$id = Field('id', _$id, opt: true);
  static String _$createdAt(OrderModel v) => v.createdAt;
  static const Field<OrderModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$uid(OrderModel v) => v.uid;
  static const Field<OrderModel, String> _f$uid = Field('uid', _$uid);
  static int _$courseId(OrderModel v) => v.courseId;
  static const Field<OrderModel, int> _f$courseId =
      Field('courseId', _$courseId, key: r'course_id');
  static CourseModel? _$courseData(OrderModel v) => v.courseData;
  static const Field<OrderModel, CourseModel> _f$courseData =
      Field('courseData', _$courseData, opt: true);
  static UserModel? _$userData(OrderModel v) => v.userData;
  static const Field<OrderModel, UserModel> _f$userData =
      Field('userData', _$userData, opt: true);

  @override
  final MappableFields<OrderModel> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #uid: _f$uid,
    #courseId: _f$courseId,
    #courseData: _f$courseData,
    #userData: _f$userData,
  };

  static OrderModel _instantiate(DecodingData data) {
    return OrderModel(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        uid: data.dec(_f$uid),
        courseId: data.dec(_f$courseId),
        courseData: data.dec(_f$courseData),
        userData: data.dec(_f$userData));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderModel>(map);
  }

  static OrderModel fromJson(String json) {
    return ensureInitialized().decodeJson<OrderModel>(json);
  }
}

mixin OrderModelMappable {
  String toJson() {
    return OrderModelMapper.ensureInitialized()
        .encodeJson<OrderModel>(this as OrderModel);
  }

  Map<String, dynamic> toMap() {
    return OrderModelMapper.ensureInitialized()
        .encodeMap<OrderModel>(this as OrderModel);
  }

  OrderModelCopyWith<OrderModel, OrderModel, OrderModel> get copyWith =>
      _OrderModelCopyWithImpl<OrderModel, OrderModel>(
          this as OrderModel, $identity, $identity);
  @override
  String toString() {
    return OrderModelMapper.ensureInitialized()
        .stringifyValue(this as OrderModel);
  }

  @override
  bool operator ==(Object other) {
    return OrderModelMapper.ensureInitialized()
        .equalsValue(this as OrderModel, other);
  }

  @override
  int get hashCode {
    return OrderModelMapper.ensureInitialized().hashValue(this as OrderModel);
  }
}

extension OrderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderModel, $Out> {
  OrderModelCopyWith<$R, OrderModel, $Out> get $asOrderModel =>
      $base.as((v, t, t2) => _OrderModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OrderModelCopyWith<$R, $In extends OrderModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CourseModelCopyWith<$R, CourseModel, CourseModel>? get courseData;
  $R call(
      {int? id,
      String? createdAt,
      String? uid,
      int? courseId,
      CourseModel? courseData,
      UserModel? userData});
  OrderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderModel, $Out>
    implements OrderModelCopyWith<$R, OrderModel, $Out> {
  _OrderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderModel> $mapper =
      OrderModelMapper.ensureInitialized();
  @override
  CourseModelCopyWith<$R, CourseModel, CourseModel>? get courseData =>
      $value.courseData?.copyWith.$chain((v) => call(courseData: v));
  @override
  $R call(
          {Object? id = $none,
          String? createdAt,
          String? uid,
          int? courseId,
          Object? courseData = $none,
          Object? userData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (uid != null) #uid: uid,
        if (courseId != null) #courseId: courseId,
        if (courseData != $none) #courseData: courseData,
        if (userData != $none) #userData: userData
      }));
  @override
  OrderModel $make(CopyWithData data) => OrderModel(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      uid: data.get(#uid, or: $value.uid),
      courseId: data.get(#courseId, or: $value.courseId),
      courseData: data.get(#courseData, or: $value.courseData),
      userData: data.get(#userData, or: $value.userData));

  @override
  OrderModelCopyWith<$R2, OrderModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
