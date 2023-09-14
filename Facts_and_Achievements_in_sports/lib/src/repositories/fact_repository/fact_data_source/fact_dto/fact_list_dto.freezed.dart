// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fact_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FactListDto _$FactListDtoFromJson(Map<String, dynamic> json) {
  return _FactListDto.fromJson(json);
}

/// @nodoc
mixin _$FactListDto {
  List<FactDto> get list_of_facts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactListDtoCopyWith<FactListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactListDtoCopyWith<$Res> {
  factory $FactListDtoCopyWith(
          FactListDto value, $Res Function(FactListDto) then) =
      _$FactListDtoCopyWithImpl<$Res, FactListDto>;
  @useResult
  $Res call({List<FactDto> list_of_facts});
}

/// @nodoc
class _$FactListDtoCopyWithImpl<$Res, $Val extends FactListDto>
    implements $FactListDtoCopyWith<$Res> {
  _$FactListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list_of_facts = null,
  }) {
    return _then(_value.copyWith(
      list_of_facts: null == list_of_facts
          ? _value.list_of_facts
          : list_of_facts // ignore: cast_nullable_to_non_nullable
              as List<FactDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactListDtoCopyWith<$Res>
    implements $FactListDtoCopyWith<$Res> {
  factory _$$_FactListDtoCopyWith(
          _$_FactListDto value, $Res Function(_$_FactListDto) then) =
      __$$_FactListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FactDto> list_of_facts});
}

/// @nodoc
class __$$_FactListDtoCopyWithImpl<$Res>
    extends _$FactListDtoCopyWithImpl<$Res, _$_FactListDto>
    implements _$$_FactListDtoCopyWith<$Res> {
  __$$_FactListDtoCopyWithImpl(
      _$_FactListDto _value, $Res Function(_$_FactListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list_of_facts = null,
  }) {
    return _then(_$_FactListDto(
      list_of_facts: null == list_of_facts
          ? _value._list_of_facts
          : list_of_facts // ignore: cast_nullable_to_non_nullable
              as List<FactDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FactListDto implements _FactListDto {
  const _$_FactListDto({required final List<FactDto> list_of_facts})
      : _list_of_facts = list_of_facts;

  factory _$_FactListDto.fromJson(Map<String, dynamic> json) =>
      _$$_FactListDtoFromJson(json);

  final List<FactDto> _list_of_facts;
  @override
  List<FactDto> get list_of_facts {
    if (_list_of_facts is EqualUnmodifiableListView) return _list_of_facts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_of_facts);
  }

  @override
  String toString() {
    return 'FactListDto(list_of_facts: $list_of_facts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactListDto &&
            const DeepCollectionEquality()
                .equals(other._list_of_facts, _list_of_facts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list_of_facts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactListDtoCopyWith<_$_FactListDto> get copyWith =>
      __$$_FactListDtoCopyWithImpl<_$_FactListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FactListDtoToJson(
      this,
    );
  }
}

abstract class _FactListDto implements FactListDto {
  const factory _FactListDto({required final List<FactDto> list_of_facts}) =
      _$_FactListDto;

  factory _FactListDto.fromJson(Map<String, dynamic> json) =
      _$_FactListDto.fromJson;

  @override
  List<FactDto> get list_of_facts;
  @override
  @JsonKey(ignore: true)
  _$$_FactListDtoCopyWith<_$_FactListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
