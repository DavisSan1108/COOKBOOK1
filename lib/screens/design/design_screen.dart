import 'package:flutter/material.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Número de ejercicios
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Design Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Drawer'),
              Tab(text: 'Snackbar'),
              Tab(text: 'Export Fonts'),
              Tab(text: 'Orientation UI'),
              Tab(text: 'Custom Font'),
              Tab(text: 'Themes'),
              Tab(text: 'Tabs'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddDrawerExample(),
            DisplaySnackbarExample(),
            ExportFontsExample(),
            OrientationUIExample(),
            CustomFontExample(),
            ThemesExample(),
            WorkWithTabsExample(),
          ],
        ),
      ),
    );
  }
}

class AddDrawerExample extends StatelessWidget {
  const AddDrawerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Drawer')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('This is the Add Drawer example.'),
      ),
    );
  }
}

class DisplaySnackbarExample extends StatelessWidget {
  const DisplaySnackbarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('This is a Snackbar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show Snackbar'),
      ),
    );
  }
}

class ExportFontsExample extends StatelessWidget {
  const ExportFontsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This text uses a custom font!',
        style: TextStyle(fontFamily: 'RobotoMono', fontSize: 20),
      ),
    );
  }
}

class OrientationUIExample extends StatelessWidget {
  const OrientationUIExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: List.generate(20, (index) {
            return Card(
              child: Center(
                child: Text('Item $index'),
              ),
            );
          }),
        );
      },
    );
  }
}

class CustomFontExample extends StatelessWidget {
  const CustomFontExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text(
          'Roboto Mono - Bold',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Regular',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Light',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Thin',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Medium',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Italic',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Roboto Mono - Bold Italic',
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class ThemesExample extends StatelessWidget {
  const ThemesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Themes Example')),
        body: const Center(
          child: Text('This is using a custom theme!'),
        ),
      ),
    );
  }
}

class WorkWithTabsExample extends StatelessWidget {
  const WorkWithTabsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Work with Tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
          ],
        ),
      ),
    );
  }
}
