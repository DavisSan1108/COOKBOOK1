import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Images Examples'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Display Internet Images'),
              Tab(text: 'Fade In with Placeholder'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DisplayInternetImagesExample(),
            FadeInImagesPlaceholderExample(),
          ],
        ),
      ),
    );
  }
}

// Activity 1: Display images from the internet
class DisplayInternetImagesExample extends StatelessWidget {
  const DisplayInternetImagesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://picsum.photos/250?image=9', // Nueva URL
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: CircularProgressIndicator(), // Indicador de carga
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.error, size: 50, color: Colors.red), // Manejo de error
          );
        },
      ),
    );
  }
}

// Activity 2: Fade in images with a placeholder
class FadeInImagesPlaceholderExample extends StatelessWidget {
  const FadeInImagesPlaceholderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/loading.gif', // Placeholder local
        image: 'https://picsum.photos/250?image=9', // Nueva URL
        fadeInDuration: const Duration(seconds: 1),
        fadeOutDuration: const Duration(seconds: 1),
        placeholderErrorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 50, color: Colors.red); // Manejo de error
        },
      ),
    );
  }
}
