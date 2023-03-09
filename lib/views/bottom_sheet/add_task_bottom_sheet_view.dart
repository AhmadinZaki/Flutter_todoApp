import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/models/task_model.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return ListView(
            // padding: const EdgeInsets.all(15),

            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "To Do",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: viewModel.clrLvl3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: TextField(
                      onSubmitted: (value) {
                        if (entryController.text.isNotEmpty) {
                          Task newTask = Task(entryController.text, false);
                          viewModel.addTask(newTask);
                          entryController.clear();
                        }
                        Navigator.of(context).pop();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            bottom: 5, left: 10, right: 10),
                        filled: true,
                        fillColor: viewModel.clrLvl2,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      // textAlign: TextAlign.center,
                      cursorColor: viewModel.clrLvl4,
                      textAlignVertical: TextAlignVertical.center,
                      autocorrect: false,
                      autofocus: true,
                      controller: entryController,
                      style: TextStyle(
                          color: viewModel.clrLvl4,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ]);
      },
    );
  }
}
