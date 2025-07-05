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
      UserModelMapper.ensureInitialized();
      CourseModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderModel';

  static int _$id(OrderModel v) => v.id;
  static const Field<OrderModel, int> _f$id = Field('id', _$id);
  static String _$createdAt(OrderModel v) => v.createdAt;
  static const Field<OrderModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static UserModel _$uid(OrderModel v) => v.uid;
  static const Field<OrderModel, UserModel> _f$uid = Field('uid', _$uid);
  static CourseModel _$courseId(OrderModel v) => v.courseId;
  static const Field<OrderModel, CourseModel> _f$courseId =
      Field('courseId', _$courseId, key: r'course_id');

  @override
  final MappableFields<OrderModel> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #uid: _f$uid,
    #courseId: _f$courseId,
  };

  static OrderModel _instantiate(DecodingData data) {
    return OrderModel(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        uid: data.dec(_f$uid),
        courseId: data.dec(_f$courseId));
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
  UserModelCopyWith<$R, UserModel, UserModel> get uid;
  CourseModelCopyWith<$R, CourseModel, CourseModel> get courseId;
  $R call({int? id, String? createdAt, UserModel? uid, CourseModel? courseId});
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
  UserModelCopyWith<$R, UserModel, UserModel> get uid =>
      $value.uid.copyWith.$chain((v) => call(uid: v));
  @override
  CourseModelCopyWith<$R, CourseModel, CourseModel> get courseId =>
      $value.courseId.copyWith.$chain((v) => call(courseId: v));
  @override
  $R call(
          {int? id,
          String? createdAt,
          UserModel? uid,
          CourseModel? courseId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (uid != null) #uid: uid,
        if (courseId != null) #courseId: courseId
      }));
  @override
  OrderModel $make(CopyWithData data) => OrderModel(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      uid: data.get(#uid, or: $value.uid),
      courseId: data.get(#courseId, or: $value.courseId));

  @override
  OrderModelCopyWith<$R2, OrderModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
