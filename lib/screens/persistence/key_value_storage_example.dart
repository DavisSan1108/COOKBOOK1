import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageExample extends StatefulWidget {
  const KeyValueStorageExample({Key? key}) : super(key: key);

  @override
  _KeyValueStorageExampleState createState() => _KeyValueStorageExampleState();
}

class _KeyValueStorageExampleState extends State<KeyValueStorageExample> {
  late SharedPreferences _prefs;
  String _username = 'Unknown User';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = _prefs.getString('username') ?? 'Unknown User';
    });
  }

  Future<void> _savePreferences(String username) async {
    await _prefs.setString('username', username);
    setState(() {
      _username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Key-Value Storage Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Stored Username: $_username', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              onSubmitted: _savePreferences,
              decoration: const InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
