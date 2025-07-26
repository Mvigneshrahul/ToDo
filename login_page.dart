import 'package:flutter/material.dart';
import 'register_page.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌟 Title
              Text(
                'TODO APP',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.deepPurple,
                    ),
              ),
              const SizedBox(height: 40),

              // 🧾 Email
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),

              // 🔒 Password
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),

              // 🔓 Login Button
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Login'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardPage()),
                  );
                },
              ),

              const SizedBox(height: 12),

              // 🔗 Register Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
                child: const Text(
                  "Don't have an account? Register",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
