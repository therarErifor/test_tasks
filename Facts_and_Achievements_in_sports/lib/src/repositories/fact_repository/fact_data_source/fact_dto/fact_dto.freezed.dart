// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fact_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FactDto _$FactDtoFromJson(Map<String, dynamic> json) {
  return _FactDto.fromJson(json);
}

/// @nodoc
mixin _$FactDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactDtoCopyWith<FactDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactDtoCopyWith<$Res> {
  factory $FactDtoCopyWith(FactDto value, $Res Function(FactDto) then) =
      _$FactDtoCopyWithImpl<$Res, FactDto>;
  @useResult
  $Res call(
      {int id, String title, String content, List<String> tags, String image});
}

/// @nodoc
class _$FactDtoCopyWithImpl<$Res, $Val extends FactDto>
    implements $FactDtoCopyWith<$Res> {
  _$FactDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? tags = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactDtoCopyWith<$Res> implements $FactDtoCopyWith<$Res> {
  factory _$$_FactDtoCopyWith(
          _$_FactDto value, $Res Function(_$_FactDto) then) =
      __$$_FactDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String content, List<String> tags, String image});
}

/// @nodoc
class __$$_FactDtoCopyWithImpl<$Res>
    extends _$FactDtoCopyWithImpl<$Res, _$_FactDto>
    implements _$$_FactDtoCopyWith<$Res> {
  __$$_FactDtoCopyWithImpl(_$_FactDto _value, $Res Function(_$_FactDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? tags = null,
    Object? image = null,
  }) {
    return _then(_$_FactDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FactDto implements _FactDto {
  const _$_FactDto(
      {required this.id,
      required this.title,
      required this.content,
      required final List<String> tags,
      required this.image})
      : _tags = tags;

  factory _$_FactDto.fromJson(Map<String, dynamic> json) =>
      _$$_FactDtoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String image;

  @override
  String toString() {
    return 'FactDto(id: $id, title: $title, content: $content, tags: $tags, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content,
      const DeepCollectionEquality().hash(_tags), image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactDtoCopyWith<_$_FactDto> get copyWith =>
      __$$_FactDtoCopyWithImpl<_$_FactDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FactDtoToJson(
      this,
    );
  }
}

abstract class _FactDto implements FactDto {
  const factory _FactDto(
      {required final int id,
      required final String title,
      required final String content,
      required final List<String> tags,
      required final String image}) = _$_FactDto;

  factory _FactDto.fromJson(Map<String, dynamic> json) = _$_FactDto.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  List<String> get tags;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_FactDtoCopyWith<_$_FactDto> get copyWith =>
      throw _privateConstructorUsedError;
}
