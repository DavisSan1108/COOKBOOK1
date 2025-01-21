import 'package:flutter/material.dart';

class SQLiteExample extends StatefulWidget {
  const SQLiteExample({Key? key}) : super(key: key);

  @override
  _SQLiteExampleState createState() => _SQLiteExampleState();
}

class _SQLiteExampleState extends State<SQLiteExample> {
  final List<String> _users = ['John Doe', 'Jane Smith']; // Lista de usuarios

  void _addUser(String name) {
    setState(() {
      _users.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Example')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  title: Text(_users[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _addUser('User ${_users.length + 1}'); // Agregar usuario dinámicamente
              },
              child: const Text('Add Random User'),
            ),
          ),
        ],
      ),
    );
  }
}
