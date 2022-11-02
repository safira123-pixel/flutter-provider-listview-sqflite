import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_listview/service/tasklist.dart';

import 'page/updatetask.dart';
import 'page/addtask.dart';
import 'page/listpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Tasklist>(
          create: (context) => Tasklist(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MyListPage(),
        "/addTask": (context) => const AddTaskPage(),
        "/updateTask": (context) => const UpdateTaskPage(),
      },
      initialRoute: "/",
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
