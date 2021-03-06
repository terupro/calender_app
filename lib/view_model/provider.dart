import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender_app/model/todo.dart';
import 'package:calender_app/service/db.dart';
import 'package:calender_app/util/util.dart';

// DBの操作を行うクラス（dbの操作にstateを絡める）
class TodoDatabaseNotifier extends StateNotifier<TodoStateData> {
  TodoDatabaseNotifier() : super(TodoStateData());

  final _db = MyDatabase(); //DBへの操作を行う

  // 書き込み処理
  writeData(TempTodoItemData data) async {
    if (data.title.isEmpty) {
      return;
    }
    TodoItemCompanion entry = TodoItemCompanion(
      title: Value(data.title),
      description: Value(data.description),
      allDay: Value(data.allDay),
      startTime: Value(data.startTime),
      endTime: Value(data.endTime),
    );
    state = state.copyWith(isLoading: true);
    await _db.writeTodo(entry);
    readData();
  }

  // 更新処理
  updateData(TodoItemData data) async {
    if (data.title.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    await _db.updateTodo(data);
    readData();
  }

  // 削除処理
  deleteData(TodoItemData data) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteTodo(data.id);
    readData();
  }

  // 読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);
    final todoItems = await _db.readAllTodoData();
    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      todoItems: todoItems,
    );
  }

  Future<List<TodoItemData>> readAllData() async {
    final db = MyDatabase();
    List<TodoItemData> datas = await db.readAllTodoData();
    return datas;
  }
}

// 無名関数の中に処理を書くことで初期化を可能にしている。これにより最新の状態を管理できる。
final todoDatabaseProvider = StateNotifierProvider((_) {
  TodoDatabaseNotifier notify = TodoDatabaseNotifier();
  notify.readData();
  return notify;
});

// 状態を管理したいもの
final visibleProvider = StateProvider<bool>((ref) => false);
final pageControllerProvider = StateProvider((ref) => PageController());
final selectedDayProvider = StateProvider((ref) => DateTime.now());
final focusedDayProvider = StateProvider((ref) => DateTime.now());
final startTimeProvider = StateProvider<DateTime?>((ref) => null);
final editStartTimeProvider = StateProvider<DateTime?>((ref) => null);
final endTimeProvider = StateProvider<DateTime?>((ref) => null);
final editEndTimeProvider = StateProvider<DateTime?>((ref) => null);
final toggleProvider = StateProvider((ref) => false);
final editToggleProvider = StateProvider((ref) => false);
final displayMonthProvider = StateProvider((ref) => DateTime.now());
