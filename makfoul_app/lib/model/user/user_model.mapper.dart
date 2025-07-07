// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String _$UID(UserModel v) => v.UID;
  static const Field<UserModel, String> _f$UID = Field('UID', _$UID);
  static String _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name = Field('name', _$name);
  static String _$role(UserModel v) => v.role;
  static const Field<UserModel, String> _f$role = Field('role', _$role);
  static String _$email(UserModel v) => v.email;
  static const Field<UserModel, String> _f$email = Field('email', _$email);
  static String _$phone(UserModel v) => v.phone;
  static const Field<UserModel, String> _f$phone = Field('phone', _$phone);
  static String? _$avatar(UserModel v) => v.avatar;
  static const Field<UserModel, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);
  static String _$createdAt(UserModel v) => v.createdAt;
  static const Field<UserModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');

  @override
  final MappableFields<UserModel> fields = const {
    #UID: _f$UID,
    #name: _f$name,
    #role: _f$role,
    #email: _f$email,
    #phone: _f$phone,
    #avatar: _f$avatar,
    #createdAt: _f$createdAt,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        UID: data.dec(_f$UID),
        name: data.dec(_f$name),
        role: data.dec(_f$role),
        email: data.dec(_f$email),
        phone: data.dec(_f$phone),
        avatar: data.dec(_f$avatar),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? UID,
      String? name,
      String? role,
      String? email,
      String? phone,
      String? avatar,
      String? createdAt});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call(
          {String? UID,
          String? name,
          String? role,
          String? email,
          String? phone,
          Object? avatar = $none,
          String? createdAt}) =>
      $apply(FieldCopyWithData({
        if (UID != null) #UID: UID,
        if (name != null) #name: name,
        if (role != null) #role: role,
        if (email != null) #email: email,
        if (phone != null) #phone: phone,
        if (avatar != $none) #avatar: avatar,
        if (createdAt != null) #createdAt: createdAt
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      UID: data.get(#UID, or: $value.UID),
      name: data.get(#name, or: $value.name),
      role: data.get(#role, or: $value.role),
      email: data.get(#email, or: $value.email),
      phone: data.get(#phone, or: $value.phone),
      avatar: data.get(#avatar, or: $value.avatar),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
