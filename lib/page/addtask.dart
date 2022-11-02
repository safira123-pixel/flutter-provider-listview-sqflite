import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/service/tasklist.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Task Baru"),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  bool buttonenabled = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.length < 5) {
                return 'Masukkan minimal 5 karakter';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Masukkan Task Baru",
            ),
            onChanged: (value) {
              context.read<Tasklist>().changeTaskName(value);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        buttonenabled = false;
                        context.read<Tasklist>().addTask();
                        Navigator.pop(context, true);
                        // formKey.currentState?.save();
                        // taskController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Task sedang diproses...')),
                        );
                      });
                    }
                  },
                  child: const Text("Tambah Task Baru"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
