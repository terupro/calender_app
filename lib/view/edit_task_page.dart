import 'package:calender_app/util/util.dart';
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
    final _todoDatabaseNotifier = ref.watch(todoDatabaseProvider.notifier);
    final _editToggleProvider = ref.watch(editToggleProvider);
    final _editToggleNotifier = ref.watch(editToggleProvider.notifier);
    final _editStartTimeProvider = ref.watch(editStartTimeProvider);
    final _editStartTimeNotifier = ref.watch(editStartTimeProvider.notifier);
    final _editEndTimeProvider = ref.watch(editEndTimeProvider);
    final _editEndTimeNotifier = ref.watch(editEndTimeProvider.notifier);
    final _titleController = TextEditingController(text: item.title);
    final _descriptionController =
        TextEditingController(text: item.description);
    var edited = item;

    return Scaffold(
      backgroundColor: baseBackGroundColor,
      appBar: AppBar(
        title: const Text('予定の編集'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '編集を破棄',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('キャンセル'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        actions: [
          SaveButtonWidget(
            press: () async {
              await _todoDatabaseNotifier.updateData(edited);
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
                        value: edited.allDay,
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
                            minTime: edited.startTime,
                            onConfirm: (date) {
                              _editStartTimeNotifier.state = date;
                              edited = edited.copyWith(startTime: date);
                            },
                            currentTime: edited.startTime,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _editStartTimeProvider == null
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
                            minTime: edited.endTime,
                            onConfirm: (date) {
                              _editEndTimeNotifier.state = date;
                              edited = edited.copyWith(endTime: date);
                            },
                            currentTime: edited.endTime,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _editStartTimeProvider == null
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
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlertDialog(
                                  title: const Text(
                                    '予定の削除',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  content: const Text('本当にこの予定を削除しますか？'),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        await db.deleteData(item);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        '削除',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('キャンセル'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
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
