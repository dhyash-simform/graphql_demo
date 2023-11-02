// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lift _$LiftFromJson(Map<String, dynamic> json) {
  return _Lift.fromJson(json);
}

/// @nodoc
mixin _$Lift {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get night => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiftCopyWith<Lift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiftCopyWith<$Res> {
  factory $LiftCopyWith(Lift value, $Res Function(Lift) then) =
      _$LiftCopyWithImpl<$Res, Lift>;
  @useResult
  $Res call({String id, String name, String status, bool night});
}

/// @nodoc
class _$LiftCopyWithImpl<$Res, $Val extends Lift>
    implements $LiftCopyWith<$Res> {
  _$LiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? night = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      night: null == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiftImplCopyWith<$Res> implements $LiftCopyWith<$Res> {
  factory _$$LiftImplCopyWith(
          _$LiftImpl value, $Res Function(_$LiftImpl) then) =
      __$$LiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String status, bool night});
}

/// @nodoc
class __$$LiftImplCopyWithImpl<$Res>
    extends _$LiftCopyWithImpl<$Res, _$LiftImpl>
    implements _$$LiftImplCopyWith<$Res> {
  __$$LiftImplCopyWithImpl(_$LiftImpl _value, $Res Function(_$LiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? night = null,
  }) {
    return _then(_$LiftImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      night: null == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiftImpl implements _Lift {
  const _$LiftImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.night});

  factory _$LiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiftImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final bool night;

  @override
  String toString() {
    return 'Lift(id: $id, name: $name, status: $status, night: $night)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.night, night) || other.night == night));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, night);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiftImplCopyWith<_$LiftImpl> get copyWith =>
      __$$LiftImplCopyWithImpl<_$LiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiftImplToJson(
      this,
    );
  }
}

abstract class _Lift implements Lift {
  const factory _Lift(
      {required final String id,
      required final String name,
      required final String status,
      required final bool night}) = _$LiftImpl;

  factory _Lift.fromJson(Map<String, dynamic> json) = _$LiftImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get status;
  @override
  bool get night;
  @override
  @JsonKey(ignore: true)
  _$$LiftImplCopyWith<_$LiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
