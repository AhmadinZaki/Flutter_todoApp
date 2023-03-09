import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';
import 'package:to_do_flutter/views/header_view.dart';
import 'package:to_do_flutter/views/task_info_view.dart';
import 'package:to_do_flutter/views/task_list_view.dart';

import 'add_task_view.dart';
import 'bottom_sheet/setting_bottom_sheet_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Consumer<AppViewModel>(builder: (context, value, child) {
        //     return InkWell(
        //       onTap: () {
        //         value.bottomSheetBuilder(SettingBottomSheetView(), context);
        //       },
        //       child: Icon(
        //         Icons.edit,
        //         color: value.clrLvl1,
        //         // size: 30,
        //       ),
        //     );
        //   }),
        // ],
        // title: const Text(
        //   // 'Schedule',
        //   '',
        // ),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: const AddTaskView(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [
            //Header view
            Expanded(flex: 1, child: HeaderView()),

            //task info view
            Expanded(flex: 1, child: TaskInfoView()),

            //task list view
            Expanded(flex: 7, child: TaskListView()),
          ],
        ),
      ),
    );
  }
}
