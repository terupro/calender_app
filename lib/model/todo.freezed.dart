// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoStateDataTearOff {
  const _$TodoStateDataTearOff();

  _TodoStateData call(
      {bool isLoading = false,
      bool isReadyData = false,
      List<TodoItemData> todoItems = const []}) {
    return _TodoStateData(
      isLoading: isLoading,
      isReadyData: isReadyData,
      todoItems: todoItems,
    );
  }
}

/// @nodoc
const $TodoStateData = _$TodoStateDataTearOff();

/// @nodoc
mixin _$TodoStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<TodoItemData> get todoItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateDataCopyWith<TodoStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateDataCopyWith<$Res> {
  factory $TodoStateDataCopyWith(
          TodoStateData value, $Res Function(TodoStateData) then) =
      _$TodoStateDataCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<TodoItemData> todoItems});
}

/// @nodoc
class _$TodoStateDataCopyWithImpl<$Res>
    implements $TodoStateDataCopyWith<$Res> {
  _$TodoStateDataCopyWithImpl(this._value, this._then);

  final TodoStateData _value;
  // ignore: unused_field
  final $Res Function(TodoStateData) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? todoItems = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: todoItems == freezed
          ? _value.todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<TodoItemData>,
    ));
  }
}

/// @nodoc
abstract class _$TodoStateDataCopyWith<$Res>
    implements $TodoStateDataCopyWith<$Res> {
  factory _$TodoStateDataCopyWith(
          _TodoStateData value, $Res Function(_TodoStateData) then) =
      __$TodoStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<TodoItemData> todoItems});
}

/// @nodoc
class __$TodoStateDataCopyWithImpl<$Res>
    extends _$TodoStateDataCopyWithImpl<$Res>
    implements _$TodoStateDataCopyWith<$Res> {
  __$TodoStateDataCopyWithImpl(
      _TodoStateData _value, $Res Function(_TodoStateData) _then)
      : super(_value, (v) => _then(v as _TodoStateData));

  @override
  _TodoStateData get _value => super._value as _TodoStateData;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? todoItems = freezed,
  }) {
    return _then(_TodoStateData(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: todoItems == freezed
          ? _value.todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<TodoItemData>,
    ));
  }
}

/// @nodoc

class _$_TodoStateData implements _TodoStateData {
  _$_TodoStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      this.todoItems = const []});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isReadyData;
  @JsonKey()
  @override
  final List<TodoItemData> todoItems;

  @override
  String toString() {
    return 'TodoStateData(isLoading: $isLoading, isReadyData: $isReadyData, todoItems: $todoItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoStateData &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality().equals(other.todoItems, todoItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(todoItems));

  @JsonKey(ignore: true)
  @override
  _$TodoStateDataCopyWith<_TodoStateData> get copyWith =>
      __$TodoStateDataCopyWithImpl<_TodoStateData>(this, _$identity);
}

abstract class _TodoStateData implements TodoStateData {
  factory _TodoStateData(
      {bool isLoading,
      bool isReadyData,
      List<TodoItemData> todoItems}) = _$_TodoStateData;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<TodoItemData> get todoItems;
  @override
  @JsonKey(ignore: true)
  _$TodoStateDataCopyWith<_TodoStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TempTodoItemDataTearOff {
  const _$TempTodoItemDataTearOff();

  _TempTodoItemData call(
      {String title = '',
      String description = '',
      bool allDay = false,
      required DateTime startTime,
      required DateTime endTime}) {
    return _TempTodoItemData(
      title: title,
      description: description,
      allDay: allDay,
      startTime: startTime,
      endTime: endTime,
    );
  }
}

/// @nodoc
const $TempTodoItemData = _$TempTodoItemDataTearOff();

/// @nodoc
mixin _$TempTodoItemData {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get allDay => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempTodoItemDataCopyWith<TempTodoItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempTodoItemDataCopyWith<$Res> {
  factory $TempTodoItemDataCopyWith(
          TempTodoItemData value, $Res Function(TempTodoItemData) then) =
      _$TempTodoItemDataCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      bool allDay,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class _$TempTodoItemDataCopyWithImpl<$Res>
    implements $TempTodoItemDataCopyWith<$Res> {
  _$TempTodoItemDataCopyWithImpl(this._value, this._then);

  final TempTodoItemData _value;
  // ignore: unused_field
  final $Res Function(TempTodoItemData) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? allDay = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TempTodoItemDataCopyWith<$Res>
    implements $TempTodoItemDataCopyWith<$Res> {
  factory _$TempTodoItemDataCopyWith(
          _TempTodoItemData value, $Res Function(_TempTodoItemData) then) =
      __$TempTodoItemDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      bool allDay,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class __$TempTodoItemDataCopyWithImpl<$Res>
    extends _$TempTodoItemDataCopyWithImpl<$Res>
    implements _$TempTodoItemDataCopyWith<$Res> {
  __$TempTodoItemDataCopyWithImpl(
      _TempTodoItemData _value, $Res Function(_TempTodoItemData) _then)
      : super(_value, (v) => _then(v as _TempTodoItemData));

  @override
  _TempTodoItemData get _value => super._value as _TempTodoItemData;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? allDay = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_TempTodoItemData(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TempTodoItemData implements _TempTodoItemData {
  _$_TempTodoItemData(
      {this.title = '',
      this.description = '',
      this.allDay = false,
      required this.startTime,
      required this.endTime});

  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String description;
  @JsonKey()
  @override
  final bool allDay;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'TempTodoItemData(title: $title, description: $description, allDay: $allDay, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TempTodoItemData &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.allDay, allDay) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(allDay),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime));

  @JsonKey(ignore: true)
  @override
  _$TempTodoItemDataCopyWith<_TempTodoItemData> get copyWith =>
      __$TempTodoItemDataCopyWithImpl<_TempTodoItemData>(this, _$identity);
}

abstract class _TempTodoItemData implements TempTodoItemData {
  factory _TempTodoItemData(
      {String title,
      String description,
      bool allDay,
      required DateTime startTime,
      required DateTime endTime}) = _$_TempTodoItemData;

  @override
  String get title;
  @override
  String get description;
  @override
  bool get allDay;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$TempTodoItemDataCopyWith<_TempTodoItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
