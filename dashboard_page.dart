import 'package:flutter/material.dart';
import 'view_task_page.dart';
import 'login_page.dart'; // ✅ Make sure this path is correct

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _taskController = TextEditingController();
  final List<String> _tasks = [];

  // Dummy user profile info
  final String username = "Vignesh";
  final String email = "vignesh@example.com";
  final String dob = "01-01-2000";

  void _addTaskDialog() {
    _taskController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Task"),
        content: TextField(
          controller: _taskController,
          decoration: const InputDecoration(hintText: "Enter task"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.trim().isEmpty) return;
              setState(() => _tasks.add(_taskController.text.trim()));
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _editTaskDialog(int index) {
    _taskController.text = _tasks[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: TextField(
          controller: _taskController,
          decoration: const InputDecoration(hintText: "Update task"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.trim().isEmpty) return;
              setState(() => _tasks[index] = _taskController.text.trim());
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void _deleteTask(int index) {
    setState(() => _tasks.removeAt(index));
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("My Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("👤 Username: $username"),
            Text("📧 Email ID: $email"),
            Text("🎂 DOB: $dob"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _logout() {
    // ✅ Navigate to LoginPage and clear navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.shade50,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
              ),
              child: const Center(
                child: Text(
                  "TODO MENU",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text("My Tasks"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ViewTaskPage(
                      title: "Sample Task",
                      description: "This is a sample task description",
                      username: username,
                      email: email,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "✨ TODO APP ✨",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            tooltip: "Profile",
            onPressed: _showProfileDialog,
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: "Logout",
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search tasks...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) {
                // Optional: implement search logic
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks yet. Add some!",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        shadowColor: Colors.deepPurple.shade100,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            _tasks[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.orange),
                                onPressed: () => _editTaskDialog(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteTask(index),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: _addTaskDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
