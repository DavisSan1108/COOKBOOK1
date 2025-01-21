import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadWriteFilesExample extends StatefulWidget {
  const ReadWriteFilesExample({Key? key}) : super(key: key);

  @override
  _ReadWriteFilesExampleState createState() => _ReadWriteFilesExampleState();
}

class _ReadWriteFilesExampleState extends State<ReadWriteFilesExample> {
  final TextEditingController _controller = TextEditingController();
  String _fileContent = 'File is empty.';

  Future<String> _getFilePath() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/my_file.txt';
    } catch (e) {
      throw Exception('Error accessing file path: $e');
    }
  }

  Future<void> _writeToFile(String content) async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      await file.writeAsString(content);
    } catch (e) {
      setState(() {
        _fileContent = 'Error writing to file: $e';
      });
    }
  }

  Future<void> _readFromFile() async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      final content = await file.readAsString();
      setState(() {
        _fileContent = content;
      });
    } catch (e) {
      setState(() {
        _fileContent = 'Error reading file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Read/Write Files Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'This activity demonstrates how to read and write files in the local storage.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _writeToFile(_controller.text);
                _controller.clear();
              },
              child: const Text('Write to File'),
            ),
            ElevatedButton(
              onPressed: _readFromFile,
              child: const Text('Read from File'),
            ),
            const SizedBox(height: 20),
            Text('File Content:', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(_fileContent),
          ],
        ),
      ),
    );
  }
}
