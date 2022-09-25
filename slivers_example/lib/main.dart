import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slivers Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final testList = [1, 2, 3, 4, 5, 6, 7, 8];

    // All Slivers should be children to this widget
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // The title below behaves like that of a typical AppBar title (it
          // does not animate with the expandedHeight)
          title: const Text('Sliver AppBar'),
          pinned: true,
          stretch: true,
          onStretchTrigger: () async {
            // Can execute a function here
          },
          backgroundColor: Colors.teal[800],

          // Responsible for the stretching behaviour
          expandedHeight: 200,

          // A very important widget. Does most of the fun displays alongside
          // the expandedHeight
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            title: const Text('Slive AppBar'),

            // It takes a background that takes a widget. This widget animates
            // and blends/fades in response to the stretched app bar.
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.teal[800]!,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Image.network(
                  'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/assets/header.jpeg'),
            ),
          ),
        ),
        SliverList(
          // SliverChildBuilderDelegate loads the list lazily and also gives
          // access to the index
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.blue,
                shadowColor: Colors.blueGrey,
                child: SizedBox(
                  height: 200,
                  child: Center(
                      child: Text(
                    '$index',
                    style: const TextStyle(fontSize: 40),
                  )),
                ),
              );
            },
            childCount: 8,
          ),
        ),
        SliverGrid(
          // Same as delegate for SliverList
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.greenAccent,
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('${testList[index]}'),
                  ),
                ),
              );
            },
            childCount: 8,
          ),
          // More information on the type of grid to be achieved.
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
        ),
        SliverList(
          // SliverChildListDelegate does not load lazily and it requires a list
          // of Widgets
          delegate: SliverChildListDelegate(
            [
              const Text('One'),
              const Text('Two'),
              const Text('Three'),
            ],
          ),
        ),
        // User SliverChildListDelegate under the hood.
        SliverGrid.count(
          crossAxisCount: 2,
          children: [
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
        ...List<int>.generate(5, (index) => index).map(
          // SliverToBoxAdapter makes it's possible to insert Box Widgets in
          // slivers
          (e) => SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          // this delegate is created by extending the
          // [SliverPersistentHeaderDelegate] (scroll down to check)
          delegate: StickySliver(
            child: Container(
              height: 400,
              color: Colors.purple,
            ),
          ),
        ),
        ...List<int>.generate(5, (index) => index).map(
          (e) => SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: SecondStickySliver(
            child: Container(
              height: 400,
              color: Colors.yellow,
            ),
          ),
        ),
        ...List<int>.generate(5, (index) => index).map(
          (e) => SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
      ],
    );
  }
}

class StickySliver extends SliverPersistentHeaderDelegate {
  // The child is typically a Box Widget
  final Widget child;

  StickySliver({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  // if maxExtent == minExtent, there will be no stretching.

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class SecondStickySliver extends SliverPersistentHeaderDelegate {
  final Widget child;

  SecondStickySliver({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
