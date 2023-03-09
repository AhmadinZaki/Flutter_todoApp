import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';
import 'package:to_do_flutter/views/bottom_sheet/setting_bottom_sheet_view.dart';

import 'bottom_sheet/delete_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, value, child) {
        return Container(
          color: Colors.lightBlue,
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: value.clrLvl1,
                              fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          value.userName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: value.clrLvl1,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    value.bottomSheetBuilder(
                        const SettingBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.edit,
                    color: value.clrLvl1,
                    // size: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    value.bottomSheetBuilder(
                        const DeleteBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: value.clrLvl1,
                    // size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
