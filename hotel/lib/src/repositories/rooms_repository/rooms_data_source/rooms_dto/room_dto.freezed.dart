// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) {
  return _RoomDto.fromJson(json);
}

/// @nodoc
mixin _$RoomDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get price_per => throw _privateConstructorUsedError;
  List<String> get peculiarities => throw _privateConstructorUsedError;
  List<String> get image_urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomDtoCopyWith<RoomDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDtoCopyWith<$Res> {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) then) =
      _$RoomDtoCopyWithImpl<$Res, RoomDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      int price,
      String price_per,
      List<String> peculiarities,
      List<String> image_urls});
}

/// @nodoc
class _$RoomDtoCopyWithImpl<$Res, $Val extends RoomDto>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? price_per = null,
    Object? peculiarities = null,
    Object? image_urls = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      price_per: null == price_per
          ? _value.price_per
          : price_per // ignore: cast_nullable_to_non_nullable
              as String,
      peculiarities: null == peculiarities
          ? _value.peculiarities
          : peculiarities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image_urls: null == image_urls
          ? _value.image_urls
          : image_urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomDtoCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$$_RoomDtoCopyWith(
          _$_RoomDto value, $Res Function(_$_RoomDto) then) =
      __$$_RoomDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int price,
      String price_per,
      List<String> peculiarities,
      List<String> image_urls});
}

/// @nodoc
class __$$_RoomDtoCopyWithImpl<$Res>
    extends _$RoomDtoCopyWithImpl<$Res, _$_RoomDto>
    implements _$$_RoomDtoCopyWith<$Res> {
  __$$_RoomDtoCopyWithImpl(_$_RoomDto _value, $Res Function(_$_RoomDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? price_per = null,
    Object? peculiarities = null,
    Object? image_urls = null,
  }) {
    return _then(_$_RoomDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      price_per: null == price_per
          ? _value.price_per
          : price_per // ignore: cast_nullable_to_non_nullable
              as String,
      peculiarities: null == peculiarities
          ? _value._peculiarities
          : peculiarities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image_urls: null == image_urls
          ? _value._image_urls
          : image_urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomDto implements _RoomDto {
  const _$_RoomDto(
      {required this.id,
      required this.name,
      required this.price,
      required this.price_per,
      required final List<String> peculiarities,
      required final List<String> image_urls})
      : _peculiarities = peculiarities,
        _image_urls = image_urls;

  factory _$_RoomDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoomDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int price;
  @override
  final String price_per;
  final List<String> _peculiarities;
  @override
  List<String> get peculiarities {
    if (_peculiarities is EqualUnmodifiableListView) return _peculiarities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_peculiarities);
  }

  final List<String> _image_urls;
  @override
  List<String> get image_urls {
    if (_image_urls is EqualUnmodifiableListView) return _image_urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image_urls);
  }

  @override
  String toString() {
    return 'RoomDto(id: $id, name: $name, price: $price, price_per: $price_per, peculiarities: $peculiarities, image_urls: $image_urls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.price_per, price_per) ||
                other.price_per == price_per) &&
            const DeepCollectionEquality()
                .equals(other._peculiarities, _peculiarities) &&
            const DeepCollectionEquality()
                .equals(other._image_urls, _image_urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      price_per,
      const DeepCollectionEquality().hash(_peculiarities),
      const DeepCollectionEquality().hash(_image_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomDtoCopyWith<_$_RoomDto> get copyWith =>
      __$$_RoomDtoCopyWithImpl<_$_RoomDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomDtoToJson(
      this,
    );
  }
}

abstract class _RoomDto implements RoomDto {
  const factory _RoomDto(
      {required final int id,
      required final String name,
      required final int price,
      required final String price_per,
      required final List<String> peculiarities,
      required final List<String> image_urls}) = _$_RoomDto;

  factory _RoomDto.fromJson(Map<String, dynamic> json) = _$_RoomDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get price;
  @override
  String get price_per;
  @override
  List<String> get peculiarities;
  @override
  List<String> get image_urls;
  @override
  @JsonKey(ignore: true)
  _$$_RoomDtoCopyWith<_$_RoomDto> get copyWith =>
      throw _privateConstructorUsedError;
}
