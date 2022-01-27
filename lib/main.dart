import "package:flutter/material.dart";
import "package:todo_app/home_view.dart";

void main() {
  runApp(const MyApp()); // Wrap your app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My ToDo App",
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(37, 43, 103, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(37, 43, 103, 1),
          )),
      home: const HomeView(),
    );
  }
}
