import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Create Todo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                    labelText: "Title",
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(37, 43, 103, 1),
                        fontWeight: FontWeight.w600),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Enter your title here"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title field is required!";
                  }
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 43, 103, 1))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 43, 103, 1))),
                    labelText: "Description",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(37, 43, 103, 1),
                      fontWeight: FontWeight.w600),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Input description"
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Description field is required!";
                    }
                  }),
              const SizedBox(height: 30),
              Row(children: [
                Expanded(
                  child: TextFormField(
                      controller: _dateController,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365))
                        ).then((selectedDate) {
                          final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");
                          _dateController.text = _dateFormat.format(selectedDate!);
                        });
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          labelText: "Date",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(37, 43, 103, 1),
                              fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Input date"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please select date!";
                        }
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                      controller: _timeController,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((selectedTime) {
                          _timeController.text = selectedTime!.format(context);
                        });
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          labelText: "Time",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(37, 43, 103, 1),
                              fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Input time"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please choose time!";
                        }
                      }),
                ),
              ]),

              const SizedBox(height: 50),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
                  padding: const EdgeInsets.all(20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // send data to backend.
                  } else {
                    // validation failed.
                  }
                },
                child: const Text(
                  "Create",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ));
  }
}
