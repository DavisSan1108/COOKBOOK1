import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NetworkingScreen extends StatelessWidget {
  const NetworkingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Networking Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Fetch Data'),
              Tab(text: 'Authenticated Requests'),
              Tab(text: 'Send Data'),
              Tab(text: 'Update Data'),
              Tab(text: 'Delete Data'),
              Tab(text: 'WebSockets'),
              Tab(text: 'Parse JSON'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FetchDataExample(),
            AuthenticatedRequestExample(),
            SendDataExample(),
            UpdateDataExample(),
            DeleteDataExample(),
            WebSocketExample(),
            ParseJsonExample(),
          ],
        ),
      ),
    );
  }
}

// Activity 1: Fetch Data
class FetchDataExample extends StatefulWidget {
  const FetchDataExample({Key? key}) : super(key: key);

  @override
  _FetchDataExampleState createState() => _FetchDataExampleState();
}

class _FetchDataExampleState extends State<FetchDataExample> {
  String _data = 'No data fetched yet';
  bool _isLoading = false;

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
      setState(() {
        _data = response.data.toString();
      });
    } catch (e) {
      setState(() {
        _data = 'Error fetching data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading
              ? const CircularProgressIndicator()
              : Text(_data, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _fetchData,
            child: const Text('Fetch Data'),
          ),
        ],
      ),
    );
  }
}

// Activity 2: Authenticated Requests
class AuthenticatedRequestExample extends StatefulWidget {
  const AuthenticatedRequestExample({Key? key}) : super(key: key);

  @override
  _AuthenticatedRequestExampleState createState() =>
      _AuthenticatedRequestExampleState();
}

class _AuthenticatedRequestExampleState
    extends State<AuthenticatedRequestExample> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _data = 'No authenticated data yet';
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
      setState(() {
        _data = 'Token: ${response.data['token']}';
      });
    } catch (e) {
      setState(() {
        _data = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
            const SizedBox(height: 16),
            Text(
              _data,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Activity 3: Send Data
class SendDataExample extends StatefulWidget {
  const SendDataExample({Key? key}) : super(key: key);

  @override
  _SendDataExampleState createState() => _SendDataExampleState();
}

class _SendDataExampleState extends State<SendDataExample> {
  String _response = '';

  void _sendData() async {
    try {
      final response = await Dio().post(
        'https://reqres.in/api/users',
        data: {'name': 'John', 'job': 'developer'},
      );
      setState(() {
        _response = response.data.toString();
      });
    } catch (e) {
      setState(() {
        _response = 'Error sending data: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_response),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _sendData,
            child: const Text('Send Data'),
          ),
        ],
      ),
    );
  }
}

// Activity 4: Update Data
class UpdateDataExample extends StatefulWidget {
  const UpdateDataExample({Key? key}) : super(key: key);

  @override
  _UpdateDataExampleState createState() => _UpdateDataExampleState();
}

class _UpdateDataExampleState extends State<UpdateDataExample> {
  String _response = '';

  void _updateData() async {
    try {
      final response = await Dio().put(
        'https://reqres.in/api/users/2',
        data: {'name': 'Jane', 'job': 'manager'},
      );
      setState(() {
        _response = response.data.toString();
      });
    } catch (e) {
      setState(() {
        _response = 'Error updating data: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_response),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _updateData,
            child: const Text('Update Data'),
          ),
        ],
      ),
    );
  }
}

// Activity 5: Delete Data
class DeleteDataExample extends StatefulWidget {
  const DeleteDataExample({Key? key}) : super(key: key);

  @override
  _DeleteDataExampleState createState() => _DeleteDataExampleState();
}

class _DeleteDataExampleState extends State<DeleteDataExample> {
  String _response = '';

  void _deleteData() async {
    try {
      final response = await Dio().delete('https://reqres.in/api/users/2');
      setState(() {
        _response = 'Resource deleted: ${response.statusCode}';
      });
    } catch (e) {
      setState(() {
        _response = 'Error deleting data: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_response),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _deleteData,
            child: const Text('Delete Data'),
          ),
        ],
      ),
    );
  }
}

// Activity 6: WebSocket



class WebSocketExample extends StatefulWidget {
  const WebSocketExample({Key? key}) : super(key: key);

  @override
  _WebSocketExampleState createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );
  final TextEditingController _controller = TextEditingController();
  String _receivedMessage = 'No messages received yet';

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter message',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _sendMessage,
            child: const Text('Send Message'),
          ),
          const SizedBox(height: 16),
          StreamBuilder(
            stream: _channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _receivedMessage = snapshot.data.toString();
              }
              return Text(
                'Received Message:\n$_receivedMessage',
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}


// Activity 7: Parse JSON
class ParseJsonExample extends StatelessWidget {
  const ParseJsonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const json = '''
    {
      "name": "John",
      "age": 30,
      "city": "New York"
    }
    ''';

    final parsedData = parseJson(json);

    return Center(
      child: Text(
        'Parsed Data:\nName: ${parsedData['name']}\nAge: ${parsedData['age']}\nCity: ${parsedData['city']}',
        textAlign: TextAlign.center,
      ),
    );
  }

  Map<String, dynamic> parseJson(String json) {
    return {
      "name": "John",
      "age": 30,
      "city": "New York",
    };
  }
}
