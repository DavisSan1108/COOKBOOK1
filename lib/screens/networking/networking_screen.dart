import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

// Activity 2: Authenticated Requests (Using Reqres)
class AuthenticatedRequestExample extends StatefulWidget {
  const AuthenticatedRequestExample({Key? key}) : super(key: key);

  @override
  _AuthenticatedRequestExampleState createState() =>
      _AuthenticatedRequestExampleState();
}

class _AuthenticatedRequestExampleState
    extends State<AuthenticatedRequestExample> {
  String _data = 'Enter credentials and press Login';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Dio().post(
        'https://reqres.in/api/login',
        data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      setState(() {
        _data = 'Login successful! Token: ${response.data['token']}';
      });
    } on DioError catch (e) {
      setState(() {
        if (e.response != null) {
          _data = 'Error: ${e.response?.data['error']}';
        } else {
          _data = 'Error: ${e.message}';
        }
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
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
            const SizedBox(height: 16),
            Text(_data, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// Activity 3: Send Data
class SendDataExample extends StatelessWidget {
  const SendDataExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Send Data Example Implementation'),
    );
  }
}

// Activity 4: Update Data
class UpdateDataExample extends StatelessWidget {
  const UpdateDataExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Update Data Example Implementation'),
    );
  }
}

// Activity 5: Delete Data
class DeleteDataExample extends StatelessWidget {
  const DeleteDataExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Delete Data Example Implementation'),
    );
  }
}

// Activity 6: WebSocket
class WebSocketExample extends StatelessWidget {
  const WebSocketExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('WebSocket Example Implementation'),
    );
  }
}

// Activity 7: Parse JSON
class ParseJsonExample extends StatelessWidget {
  const ParseJsonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Parse JSON Example Implementation'),
    );
  }
}
