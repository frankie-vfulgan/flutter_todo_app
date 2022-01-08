import "package:flutter/material.dart";
import "package:todo_app/utilities.dart";

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _uncompletedData = [];
  final List<Map<String, dynamic>> _completedData = [];
  final List<Map <String, dynamic>> data = [
    {
      "title": "Jummah",
      "description": "Go to the Mosque.",
      "date_time": "Today",
      "status": "true"
    },
    {
      "title": "Visit",
      "description": "Go to Michael's house.",
      "date_time": "Yesterday",
      "status": "true"
    },
    {
      "title": "Visit",
      "description": "Go to Ohemaa Abena's house.",
      "date_time": "Tomorrow",
      "status": "false"
    },
    {
      "title": "Poetry",
      "description": "Finish up with the poem.",
      "date_time": "Today",
      "status": "true"
    },
    {
      "title": "Shopping",
      "description": "Buy some groceries at the market.",
      "date_time": "Sunday",
      "status": "false"
    },
    {
      "title": "Mom",
      "description": "Call Mom to find out how she is doing.",
      "date_time": "Yesterday",
      "status": "true"
    },
    {
      "title": "Assignments",
      "description": "Complete all assignments and submit.",
      "date_time": "Tommorrow",
      "status": "false"
    },
  ];

  @override
  Widget build(BuildContext context) {
    for (Map <String, dynamic> element in data) {
      if (!element ["status"]) {
        _uncompletedData.add(element);
      }
      else {
        _completedData.add(element);
      }
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(Icons.task_alt_rounded, color: Colors.orange, size: 40),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("My Tasks",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Icon(Icons.check_circle_outline_outlined,
                        color: customColor(date: "Today")),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(data[index]["title"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(data[index]["description"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey)),
                        ),
                      ]),
                    ),
                    const SizedBox(width: 15),
                    Row(children: [
                      Icon(Icons.notifications_outlined,
                          color: customColor(date: "Today")),
                      Text("Today",
                          style: TextStyle(color: customColor(date: "Today")))
                    ])
                  ]),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemCount: _uncompletedData.length
          ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Material(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(37, 43, 103, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: const [
                  Icon(Icons.check_circle, size: 30, color: Colors.white),
                  SizedBox(width: 20),
                  Text("Completed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("24",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}