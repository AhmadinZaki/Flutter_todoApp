import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/splash_screen.dart';
import 'package:to_do_flutter/view_models/app_view_model.dart';
import 'package:to_do_flutter/views/task_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TaskPage(),
      home: SplashScreen(),
      routes: {'/home': (context) => const TaskPage()},
    );
  }
}
