import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/models/task.dart';
import 'package:provider_listview/service/tasklist.dart';

class UpdateTaskPage extends StatelessWidget {
  const UpdateTaskPage({super.key});

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
                return 'Masukan min 5 character';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Update Task",
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
                      Navigator.pop(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text("Update task"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
