import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender_app/common/date_setting_widget.dart';
import 'package:calender_app/common/save_button_widget.dart';
import 'package:calender_app/common/text_field_widget.dart';
import 'package:calender_app/model/todo.dart';
import 'package:calender_app/service/db.dart';
import 'package:calender_app/view_model/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// 既存のタスクに編集を加えるためのファイル

class EditTaskPage extends ConsumerWidget {
  const EditTaskPage({
    Key? key,
    required this.item,
    required this.db,
  }) : super(key: key);

  final TodoItemData item;
  final TodoDatabaseNotifier db;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerの監視
    final _selectedDayProvider = ref.watch(selectedDayProvider);
    final _selectedDayNotifier = ref.watch(selectedDayProvider.notifier);
    final _toggleProvider = ref.watch(toggleProvider);
    final _toggleNotifier = ref.watch(toggleProvider.notifier);
    final _startTimeProvider = ref.watch(startTimeProvider);
    final _startTimeNotifier = ref.watch(startTimeProvider.notifier);
    final _endTimeProvider = ref.watch(endTimeProvider);
    final _endTimeNotifier = ref.watch(endTimeProvider.notifier);
    final _todoProvider = ref.watch(todoDatabaseProvider);
    final _todoNotifier = ref.watch(todoDatabaseProvider.notifier);

    // コントローラー
    final _titleController = TextEditingController(text: item.title);
    final _descriptionController =
        TextEditingController(text: item.description);

    // 保存するタスク
    var edited = item;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('予定の編集'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _toggleNotifier.state = false;
            Navigator.pop(context);
          },
        ),
        actions: [
          SaveButtonWidget(
            press: () async {
              await _todoNotifier.updateData(edited);
              print(edited);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _titleController,
                  label: 'タイトルを入力してください',
                  contentPadding: const EdgeInsets.all(15),
                  changed: (value) {
                    edited = edited.copyWith(title: value);
                  },
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    DateSettingWidget(
                      label: '終日',
                      child: Switch(
                        value: item.allDay,
                        onChanged: (value) {
                          edited = edited.copyWith(allDay: value);
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 1),
                    DateSettingWidget(
                      label: '開始',
                      child: GestureDetector(
                        onTap: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            onConfirm: (date) {
                              _startTimeNotifier.state = date;
                              edited = edited.copyWith(startTime: date);
                            },
                            currentTime: _selectedDayNotifier.state,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _startTimeProvider == null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(item.startTime!)
                              : DateFormat('yyyy-MM-dd HH:mm')
                                  .format(edited.startTime!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 1),
                    DateSettingWidget(
                      label: '終了',
                      child: GestureDetector(
                        onTap: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            onConfirm: (date) {
                              _endTimeNotifier.state = date;
                              edited = edited.copyWith(endTime: date);
                            },
                            currentTime: _selectedDayNotifier.state,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _endTimeProvider == null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(item.endTime!)
                              : DateFormat('yyyy-MM-dd HH:mm')
                                  .format(edited.endTime!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      controller: _descriptionController,
                      label: 'コメントを入力してください',
                      contentPadding: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                        bottom: 150,
                        right: 15,
                      ),
                      changed: (value) {
                        edited = edited.copyWith(description: value);
                      },
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () async {
                        await db.deleteData(item);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text(
                          'この予定を削除',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}