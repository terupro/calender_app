import 'package:calender_app/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender_app/common/date_setting_widget.dart';
import 'package:calender_app/common/save_button_widget.dart';
import 'package:calender_app/common/text_field_widget.dart';
import 'package:calender_app/model/todo.dart';
import 'package:calender_app/view_model/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// 新しいタスクを追加するためのファイル

class AddTaskPage extends ConsumerWidget {
  late TempTodoItemData temp =
      TempTodoItemData(startTime: initialDate, endTime: initialDate);
  final DateTime initialDate;
  AddTaskPage(this.initialDate);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _todoDatabaseNotifier = ref.watch(todoDatabaseProvider.notifier);
    final _toggleProvider = ref.watch(toggleProvider);
    final _toggleNotifier = ref.watch(toggleProvider.notifier);
    final _startTimeProvider = ref.watch(startTimeProvider);
    final _startTimeNotifier = ref.watch(startTimeProvider.notifier);
    final _endTimeProvider = ref.watch(endTimeProvider);
    final _endTimeNotifier = ref.watch(endTimeProvider.notifier);

    return Scaffold(
      backgroundColor: baseBackGroundColor,
      appBar: AppBar(
        title: const Text('予定の追加'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SaveButtonWidget(
            press: () async {
              if (temp.title == '') {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return addAlert('タイトルを入力してください。', () {
                      Navigator.pop(context);
                    });
                  },
                );
              } else if (temp.description == '') {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return addAlert('コメントを入力してください。', () {
                      Navigator.pop(context);
                    });
                  },
                );
              } else {
                await _todoDatabaseNotifier.writeData(temp);
                Navigator.pop(context);
              }
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
                  label: 'タイトルを入力してください',
                  contentPadding: const EdgeInsets.all(15),
                  changed: (value) {
                    temp = temp.copyWith(title: value);
                  },
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    DateSettingWidget(
                      label: '終日',
                      child: Switch(
                        value: temp.allDay,
                        onChanged: (value) {
                          _toggleNotifier.state = value;
                          temp = temp.copyWith(allDay: value);
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
                            minTime: initialDate,
                            onConfirm: (date) {
                              _startTimeNotifier.state = date;
                              temp = temp.copyWith(startTime: date);
                            },
                            currentTime: initialDate,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _startTimeProvider == null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(initialDate)
                              : DateFormat('yyyy-MM-dd HH:mm')
                                  .format(temp.startTime),
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
                            minTime: initialDate,
                            onConfirm: (date) {
                              _endTimeNotifier.state = date;
                              temp = temp.copyWith(endTime: date);
                            },
                            currentTime: initialDate,
                            locale: LocaleType.jp,
                          );
                        },
                        child: Text(
                          _endTimeProvider == null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(initialDate)
                              : DateFormat('yyyy-MM-dd HH:mm')
                                  .format(temp.endTime),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      label: 'コメントを入力してください',
                      contentPadding: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                        bottom: 150,
                        right: 15,
                      ),
                      changed: (value) {
                        temp = temp.copyWith(description: value);
                      },
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

  Widget addAlert(String label, VoidCallback press) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: Text(label),
          actions: [
            TextButton(
              onPressed: press,
              child: const Text('OK'),
            ),
          ],
        ),
      ],
    );
  }
}
