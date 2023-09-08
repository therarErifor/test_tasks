// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_the_hotel_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AboutTheHotelDto _$AboutTheHotelDtoFromJson(Map<String, dynamic> json) {
  return _AboutTheHotelDto.fromJson(json);
}

/// @nodoc
mixin _$AboutTheHotelDto {
  String get description => throw _privateConstructorUsedError;
  List<String> get peculiarities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutTheHotelDtoCopyWith<AboutTheHotelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutTheHotelDtoCopyWith<$Res> {
  factory $AboutTheHotelDtoCopyWith(
          AboutTheHotelDto value, $Res Function(AboutTheHotelDto) then) =
      _$AboutTheHotelDtoCopyWithImpl<$Res, AboutTheHotelDto>;
  @useResult
  $Res call({String description, List<String> peculiarities});
}

/// @nodoc
class _$AboutTheHotelDtoCopyWithImpl<$Res, $Val extends AboutTheHotelDto>
    implements $AboutTheHotelDtoCopyWith<$Res> {
  _$AboutTheHotelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? peculiarities = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      peculiarities: null == peculiarities
          ? _value.peculiarities
          : peculiarities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutTheHotelDtoCopyWith<$Res>
    implements $AboutTheHotelDtoCopyWith<$Res> {
  factory _$$_AboutTheHotelDtoCopyWith(
          _$_AboutTheHotelDto value, $Res Function(_$_AboutTheHotelDto) then) =
      __$$_AboutTheHotelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, List<String> peculiarities});
}

/// @nodoc
class __$$_AboutTheHotelDtoCopyWithImpl<$Res>
    extends _$AboutTheHotelDtoCopyWithImpl<$Res, _$_AboutTheHotelDto>
    implements _$$_AboutTheHotelDtoCopyWith<$Res> {
  __$$_AboutTheHotelDtoCopyWithImpl(
      _$_AboutTheHotelDto _value, $Res Function(_$_AboutTheHotelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? peculiarities = null,
  }) {
    return _then(_$_AboutTheHotelDto(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      peculiarities: null == peculiarities
          ? _value._peculiarities
          : peculiarities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AboutTheHotelDto implements _AboutTheHotelDto {
  const _$_AboutTheHotelDto(
      {required this.description, required final List<String> peculiarities})
      : _peculiarities = peculiarities;

  factory _$_AboutTheHotelDto.fromJson(Map<String, dynamic> json) =>
      _$$_AboutTheHotelDtoFromJson(json);

  @override
  final String description;
  final List<String> _peculiarities;
  @override
  List<String> get peculiarities {
    if (_peculiarities is EqualUnmodifiableListView) return _peculiarities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_peculiarities);
  }

  @override
  String toString() {
    return 'AboutTheHotelDto(description: $description, peculiarities: $peculiarities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutTheHotelDto &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._peculiarities, _peculiarities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description,
      const DeepCollectionEquality().hash(_peculiarities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutTheHotelDtoCopyWith<_$_AboutTheHotelDto> get copyWith =>
      __$$_AboutTheHotelDtoCopyWithImpl<_$_AboutTheHotelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AboutTheHotelDtoToJson(
      this,
    );
  }
}

abstract class _AboutTheHotelDto implements AboutTheHotelDto {
  const factory _AboutTheHotelDto(
      {required final String description,
      required final List<String> peculiarities}) = _$_AboutTheHotelDto;

  factory _AboutTheHotelDto.fromJson(Map<String, dynamic> json) =
      _$_AboutTheHotelDto.fromJson;

  @override
  String get description;
  @override
  List<String> get peculiarities;
  @override
  @JsonKey(ignore: true)
  _$$_AboutTheHotelDtoCopyWith<_$_AboutTheHotelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
