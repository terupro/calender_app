import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'db.g.dart';

// テーブルの作成
class TodoItem extends Table {
  // ①主キー
  IntColumn get id => integer().autoIncrement()();
  // ②タイトル
  TextColumn get title =>
      text().withDefault(const Constant('')).withLength(min: 1)();
  // ③説明文
  TextColumn get description => text().withDefault(const Constant(''))();
  // ④開始日
  DateTimeColumn get startTime => dateTime().nullable()();
  // ⑤終了日
  DateTimeColumn get endTime => dateTime().nullable()();
  // ⑥終日
  BoolColumn get allDay => boolean().withDefault(const Constant(false))();
}

// データベースの場所を指定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // db.sqliteファイルをアプリのドキュメントフォルダに置く
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// データベースの操作
@DriftDatabase(tables: [TodoItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // テーブルと列を変更する際に使用する
  @override
  int get schemaVersion => 1;

  // 全データの取得
  Future<List<TodoItemData>> readAllTodoData() => select(todoItem).get();

  // データの追加
  Future writeTodo(TodoItemCompanion data) => into(todoItem).insert(data);

  // データの更新
  Future updateTodo(TodoItemData data) => update(todoItem).replace(data);

  // データの削除
  Future deleteTodo(int id) =>
      (delete(todoItem)..where((it) => it.id.equals(id))).go();
}
