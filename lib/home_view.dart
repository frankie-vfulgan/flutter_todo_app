import "package:flutter/material.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import 'package:todo_app/create_todo.dart';
import "package:todo_app/utilities.dart";

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = "todo";

  final List<Map<String, dynamic>> _uncompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      "title": "Visit",
      "description": "Go to Ohemaa Abena's house.",
      "date_time": "Yesterday",
      "status": true
    },
    {
      "title": "Poetry",
      "description": "Finish up with the poem.",
      "date_time": "Today",
      "status": true
    },
    {
      "title": "Shopping",
      "description": "Buy some groceries at the market.",
      "date_time": "Tomorrow",
      "status": false
    },
    {
      "title": "Mom",
      "description": "Call Mom to find out how she is doing.",
      "date_time": "Today",
      "status": false
    },
    {
      "title": "Assignments",
      "description": "Complete all assignments and submit.",
      "date_time": "Jan. 28",
      "status": false
    },
    {
      "title": "Laundry",
      "description": "Drop off laundry at the Laundromat.",
      "date_time": "Tomorrow",
      "status": false
    },
    {
      "title": "Grab a Bite",
      "description": "Grab lunch at StoryBella.",
      "date_time": "Today",
      "status": true
    },
    {
      "title": "Invoice",
      "description": "Email Invoice to client.",
      "date_time": "Yesterday",
      "status": true
    },
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element["status"]) {
        _uncompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(Icons.task_alt_rounded, color: Colors.orange, size: 40),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "My Tasks",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
          ),

          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search))),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(child: Text("Todo"), value: "todo"),
                    const PopupMenuItem(
                        child: Text("Completed"), value: "completed")
                  ];
                },
              ),
            )
          ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CreateTodo();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),

      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return TaskCardWidget(
              title: selectedItem == "todo"
                ? _uncompletedData[index]["title"]
                : _completedData[index]["title"],
              description: selectedItem == "todo"
                ? _uncompletedData[index]["description"]
                : _completedData[index]["description"],
              dateTime: selectedItem == "todo"
                ? _uncompletedData[index]["date_time"]
                : _completedData[index]["date_time"]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemCount: selectedItem == "todo"
              ? _uncompletedData.length
              : _completedData.length),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return TaskCardWidget(
                        title: _completedData[index]["title"],
                        description: _completedData[index]["description"],
                        dateTime: _completedData[index]["date_time"]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                    itemCount: _completedData.length
                  );
                });
            },
            child: Material(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(37, 43, 103, 1),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle,
                          size: 30, color: Colors.white),
                      const SizedBox(width: 20),
                      const Text(
                        "Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                      ),
                      const Spacer(),
                      Text("${_completedData.length}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.dateTime})
      : super(key: key);

  final String title;
  final String description;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Icon(Icons.check_circle_outline_outlined,
                color: customColor(date: dateTime)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(37, 43, 103, 1))),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ]),
            ),
            const SizedBox(width: 15),
            Row(children: [
              Icon(Icons.notifications_outlined,
                  color: customColor(date: dateTime)),
              Text(dateTime,
                  style: TextStyle(color: customColor(date: dateTime)))
            ])
          ]),
        ));
  }
}
