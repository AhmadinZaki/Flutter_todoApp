import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, value, child) {
      return Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        color: Colors.lightBlue,
        child: Row(
          children: [
//Total Tasks
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FittedBox(
                            child: Text(
                              "${value.numTasks}",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: value.clrLvl3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Total Tasks',
                            style: TextStyle(
                                color: value.clrLvl4,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(width: 15),
//Remaining Tasks
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Text(
                          "${value.numTaskRemaining}",
                          style: TextStyle(
                              fontSize: 28,
                              color: value.clrLvl3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Remaining Tasks',
                        style: TextStyle(
                            color: value.clrLvl4, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );
    });
  }
}
