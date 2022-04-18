import 'package:calender_app/service/db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class TodoStateData with _$TodoStateData {
  // DBの状態を保持するクラス
  factory TodoStateData({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default([]) List<TodoItemData> todoItems,
  }) = _TodoStateData;
}

@freezed
class TempTodoItemData with _$TempTodoItemData {
  // 入力中のtodoの状態を保持するクラス
  factory TempTodoItemData({
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool allDay,
    @Default(null) DateTime? startTime,
    @Default(null) DateTime? endTime,
  }) = _TempTodoItemData;
}
