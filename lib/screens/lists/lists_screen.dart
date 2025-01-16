import 'package:flutter/material.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lists Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Grid List'),
              Tab(text: 'Horizontal List'),
              Tab(text: 'Different Items'),
              Tab(text: 'Floating AppBar'),
              Tab(text: 'Use Lists'),
              Tab(text: 'Long List'),
              Tab(text: 'Spaced Items'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CreateGridListExample(),
            CreateHorizontalListExample(),
            CreateDifferentItemsListExample(),
            FloatingAppBarListExample(),
            UseListsExample(),
            WorkWithLongListsExample(),
            CreateSpacedItemsListExample(),
          ],
        ),
      ),
    );
  }
}

// Activity 1: Create a grid list
class CreateGridListExample extends StatelessWidget {
  const CreateGridListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(10, (index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: Center(
            child: Text('Item $index', style: const TextStyle(fontSize: 18)),
          ),
        );
      }),
    );
  }
}

// Activity 2: Create a horizontal list
class CreateHorizontalListExample extends StatelessWidget {
  const CreateHorizontalListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          width: 120,
          margin: const EdgeInsets.all(8),
          color: Colors.blue[(index + 1) * 100],
          child: Center(
            child: Text('Item $index', style: const TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}

// Activity 3: Create lists with different types of items
class CreateDifferentItemsListExample extends StatelessWidget {
  const CreateDifferentItemsListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text('Text Item')),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text('Image Item'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.video_library),
          title: const Text('Video Item'),
          onTap: () {},
        ),
      ],
    );
  }
}

// Activity 4: Place a floating app bar above a list
class FloatingAppBarListExample extends StatelessWidget {
  const FloatingAppBarListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Floating AppBar'),
            background: Image.network(
              'https://picsum.photos/800/400',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item $index')),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

// Activity 5: Use lists
class UseListsExample extends StatelessWidget {
  const UseListsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.star),
          title: Text('Item $index'),
        );
      },
    );
  }
}

// Activity 6: Work with long lists
class WorkWithLongListsExample extends StatelessWidget {
  const WorkWithLongListsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

// Activity 7: Create a list with spaced items
class CreateSpacedItemsListExample extends StatelessWidget {
  const CreateSpacedItemsListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
