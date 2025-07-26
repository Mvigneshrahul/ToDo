import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  final Function(String title, String description) onSave;

  const EditTaskPage({super.key, required this.onSave});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  List<Map<String, String>> taskList = [];

  void addTask() {
    final title = titleController.text;
    final desc = descController.text;

    if (title.isNotEmpty && desc.isNotEmpty) {
      setState(() {
        taskList.add({"title": title, "desc": desc});
        titleController.clear();
        descController.clear();
      });
      widget.onSave(title, desc);
    }
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Task Title"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_circle, size: 32, color: Colors.blue),
                onPressed: addTask,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.check_box_outline_blank),
                      title: Text(taskList[index]['title']!),
                      subtitle: Text(taskList[index]['desc']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 54, 117, 244)),
                        onPressed: () => deleteTask(index),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
