// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomsListDto _$RoomsListDtoFromJson(Map<String, dynamic> json) {
  return _RoomsListDto.fromJson(json);
}

/// @nodoc
mixin _$RoomsListDto {
  List<RoomDto> get rooms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomsListDtoCopyWith<RoomsListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsListDtoCopyWith<$Res> {
  factory $RoomsListDtoCopyWith(
          RoomsListDto value, $Res Function(RoomsListDto) then) =
      _$RoomsListDtoCopyWithImpl<$Res, RoomsListDto>;
  @useResult
  $Res call({List<RoomDto> rooms});
}

/// @nodoc
class _$RoomsListDtoCopyWithImpl<$Res, $Val extends RoomsListDto>
    implements $RoomsListDtoCopyWith<$Res> {
  _$RoomsListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_value.copyWith(
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomsListDtoCopyWith<$Res>
    implements $RoomsListDtoCopyWith<$Res> {
  factory _$$_RoomsListDtoCopyWith(
          _$_RoomsListDto value, $Res Function(_$_RoomsListDto) then) =
      __$$_RoomsListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoomDto> rooms});
}

/// @nodoc
class __$$_RoomsListDtoCopyWithImpl<$Res>
    extends _$RoomsListDtoCopyWithImpl<$Res, _$_RoomsListDto>
    implements _$$_RoomsListDtoCopyWith<$Res> {
  __$$_RoomsListDtoCopyWithImpl(
      _$_RoomsListDto _value, $Res Function(_$_RoomsListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_$_RoomsListDto(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomsListDto implements _RoomsListDto {
  const _$_RoomsListDto({required final List<RoomDto> rooms}) : _rooms = rooms;

  factory _$_RoomsListDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoomsListDtoFromJson(json);

  final List<RoomDto> _rooms;
  @override
  List<RoomDto> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'RoomsListDto(rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomsListDto &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomsListDtoCopyWith<_$_RoomsListDto> get copyWith =>
      __$$_RoomsListDtoCopyWithImpl<_$_RoomsListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomsListDtoToJson(
      this,
    );
  }
}

abstract class _RoomsListDto implements RoomsListDto {
  const factory _RoomsListDto({required final List<RoomDto> rooms}) =
      _$_RoomsListDto;

  factory _RoomsListDto.fromJson(Map<String, dynamic> json) =
      _$_RoomsListDto.fromJson;

  @override
  List<RoomDto> get rooms;
  @override
  @JsonKey(ignore: true)
  _$$_RoomsListDtoCopyWith<_$_RoomsListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
