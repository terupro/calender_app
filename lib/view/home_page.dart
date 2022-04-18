import 'dart:collection';
import 'package:calender_app/model/todo.dart';
import 'package:calender_app/service/db.dart';
import 'package:calender_app/view/add_task_page.dart';
import 'package:calender_app/view/edit_task_page.dart';
import 'package:calender_app/view_model/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerの監視
    final _selectedDayNotifier = ref.watch(selectedDayProvider.notifier);
    final _focusedDayNotifier = ref.watch(focusedDayProvider.notifier);
    final _visibleProvider = ref.watch(visibleProvider);
    final _visibleNotifier = ref.watch(visibleProvider.notifier);
    final _toggleNotifier = ref.watch(toggleProvider.notifier);
    final _startTimeNotifier = ref.watch(startTimeProvider.notifier);
    final _endTimeNotifier = ref.watch(endTimeProvider.notifier);
    final _todoProvider = ref.watch(todoDatabaseProvider);
    final _todoNotifier = ref.watch(todoDatabaseProvider.notifier);

    // 追加画面を閉じたら再ビルドするために使用する
    List<TodoItemData> todoItems = _todoNotifier.state.todoItems;

    // todoの一覧を格納するリスト
    List<Widget> tiles = _buildTodoList(todoItems, _todoNotifier);

    // イベントの内容をここに入れ込む！
    Map<DateTime, List> _eventsList = {};

    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List _getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender'),
      ),
      body: Stack(
        children: [
          TableCalendar(
            locale: 'ja',
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDayNotifier.state,
            calendarStyle: CalendarStyle(
              cellMargin: const EdgeInsets.all(8.0),
              weekendTextStyle: const TextStyle(color: Colors.red),
              holidayTextStyle: const TextStyle(color: Colors.red),
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDayNotifier.state, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              // Providerの状態を更新
              _selectedDayNotifier.state = selectedDay;
              _selectedDayNotifier.state = focusedDay;
              _visibleNotifier.state = true;
            },
          ),
          GestureDetector(
            onTap: () => _visibleNotifier.state = false,
            child: Visibility(
              visible: _visibleProvider,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          Visibility(
            visible: _visibleProvider,
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 50),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tiles,
              ),
            ),
          )
        ],
      ),
    );
  }

  // todo一覧
  List<Widget> _buildTodoList(
    List<TodoItemData> items,
    TodoDatabaseNotifier db,
  ) {
    List<Widget> list = [];
    for (TodoItemData item in items) {
      Widget tile = _tile(item, db);
      list.add(tile);
    }
    return list;
  }

  // todo
  Widget _tile(TodoItemData item, TodoDatabaseNotifier db) {
    return Consumer(
      builder: ((context, ref, child) {
        final _selectedDayNotifier = ref.watch(selectedDayProvider.notifier);
        return Container(
          width: 355,
          height: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('yyyy/MM/dd (E)', "ja")
                        .format(_selectedDayNotifier.state),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Divider(height: 2),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(item: item, db: db),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        item.allDay == true
                            ? const Text('終日')
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('HH:mm').format(item.startTime!),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DateFormat('HH:mm').format(item.endTime!),
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                        const SizedBox(width: 10),
                        Container(
                          width: 5,
                          height: 43,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          (item.title),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),
            ],
          ),
        );
      }),
    );
  }
}
