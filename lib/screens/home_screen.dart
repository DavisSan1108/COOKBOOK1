import 'package:flutter/material.dart';
import 'design/design_screen.dart';
import 'forms/forms_screen.dart';
import 'images/images_screen.dart';
import 'lists/lists_screen.dart';
import 'navigation/navigation_screen.dart';
import 'first_app_screen.dart';
import 'persistence/persistence_screen.dart';
import 'networking/networking_screen.dart';
import 'effects/effects_screen.dart'; // Importa la nueva actividad

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Cookbook'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Choose a Section',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            _buildCustomButton(
              context,
              title: 'Design',
              icon: Icons.design_services,
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DesignScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Forms',
              icon: Icons.text_fields,
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormsScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Images',
              icon: Icons.image,
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImagesScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Lists',
              icon: Icons.list,
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListsScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Navigation',
              icon: Icons.navigation,
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'First App',
              icon: Icons.create,
              color: Colors.cyan,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstAppScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Persistence',
              icon: Icons.save,
              color: Colors.brown,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersistenceScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Networking',
              icon: Icons.network_wifi,
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NetworkingScreen()),
                );
              },
            ),
            _buildCustomButton(
              context,
              title: 'Effects',
              icon: Icons.auto_awesome,
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EffectsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
