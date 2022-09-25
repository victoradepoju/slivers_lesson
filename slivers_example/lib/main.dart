import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slivers Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.teal,
          expandedHeight: 200,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Sliver AppBar'),
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.teal[800]!, Colors.transparent]),
              ),
              child: Image.network(
                'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/assets/header.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ...List<int>.generate(5, (index) => index).map(
          (e) => SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        ...List<int>.generate(5, (index) => index).map(
          (e) => SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: 40,
                  child: const Center(child: Text('Grid one')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: 40,
                  child: const Center(child: Text('Grid one')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: 40,
                  child: const Center(child: Text('Grid one')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: 40,
                  child: const Center(child: Text('Grid one')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                  height: 40,
                  child: const Center(child: Text('Grid one')),
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.blue,
                child: Text('$index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
