import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          color: Colors.lightBlue,
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: viewModel.numTasks,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {
                    viewModel.deleteTask(index);
                  },
                  background: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black45,
                      )),
                  key: UniqueKey(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: viewModel.clrLvl1,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(width: 2, color: viewModel.clrLvl3),
                        checkColor: viewModel.clrLvl1,
                        activeColor: viewModel.clrLvl3,
                        value: viewModel.getTaskValue(index),
                        onChanged: (value) {
                          viewModel.setTaskValue(index, value!);
                        },
                      ),
                      title: Text(
                        viewModel.getTaskTile(index),
                        style: TextStyle(
                            color: viewModel.clrLvl4,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
