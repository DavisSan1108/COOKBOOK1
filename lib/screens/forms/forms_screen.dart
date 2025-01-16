import 'package:flutter/material.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forms Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Validation'),
              Tab(text: 'Style Text Field'),
              Tab(text: 'Focus'),
              Tab(text: 'Handle Changes'),
              Tab(text: 'Retrieve Value'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BuildFormValidationExample(),
            CreateStyleTextFieldExample(),
            FocusTextFieldExample(),
            HandleChangesTextFieldExample(),
            RetrieveValueTextFieldExample(),
          ],
        ),
      ),
    );
  }
}

// Activity 1: Build a form with validation
class BuildFormValidationExample extends StatefulWidget {
  const BuildFormValidationExample({Key? key}) : super(key: key);

  @override
  _BuildFormValidationExampleState createState() =>
      _BuildFormValidationExampleState();
}

class _BuildFormValidationExampleState
    extends State<BuildFormValidationExample> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter your name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid!')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Activity 2: Create and style a text field
class CreateStyleTextFieldExample extends StatelessWidget {
  const CreateStyleTextFieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter something',
          hintText: 'Styled TextField',
          suffixIcon: Icon(Icons.check),
        ),
      ),
    );
  }
}

// Activity 3: Focus and text fields
class FocusTextFieldExample extends StatefulWidget {
  const FocusTextFieldExample({Key? key}) : super(key: key);

  @override
  _FocusTextFieldExampleState createState() => _FocusTextFieldExampleState();
}

class _FocusTextFieldExampleState extends State<FocusTextFieldExample> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            focusNode: _focusNode,
            decoration: const InputDecoration(labelText: 'Focus me!'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: const Text('Focus TextField'),
          ),
        ],
      ),
    );
  }
}

// Activity 4: Handle changes to a text field
class HandleChangesTextFieldExample extends StatefulWidget {
  const HandleChangesTextFieldExample({Key? key}) : super(key: key);

  @override
  _HandleChangesTextFieldExampleState createState() =>
      _HandleChangesTextFieldExampleState();
}

class _HandleChangesTextFieldExampleState
    extends State<HandleChangesTextFieldExample> {
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _inputValue = value;
              });
            },
            decoration: const InputDecoration(labelText: 'Type something'),
          ),
          const SizedBox(height: 20),
          Text('You typed: $_inputValue'),
        ],
      ),
    );
  }
}

// Activity 5: Retrieve the value of a text field
class RetrieveValueTextFieldExample extends StatefulWidget {
  const RetrieveValueTextFieldExample({Key? key}) : super(key: key);

  @override
  _RetrieveValueTextFieldExampleState createState() =>
      _RetrieveValueTextFieldExampleState();
}

class _RetrieveValueTextFieldExampleState
    extends State<RetrieveValueTextFieldExample> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Enter something'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You entered: ${_controller.text}')),
              );
            },
            child: const Text('Retrieve Value'),
          ),
        ],
      ),
    );
  }
}
