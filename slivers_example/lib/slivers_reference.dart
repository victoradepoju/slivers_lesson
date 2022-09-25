// CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               // title: Text('Sliver AppBar'),
//               pinned: true,
//               stretch: true,
//               onStretchTrigger: () async {
//                 print('Load new data');
//               },
//               backgroundColor: Colors.teal[800],
//               expandedHeight: 200,
//               flexibleSpace: FlexibleSpaceBar(
//                 stretchModes: const [
//                   StretchMode.zoomBackground,
//                   StretchMode.fadeTitle,
//                   StretchMode.blurBackground,
//                 ],
//                 title: const Text('Slive AppBar'),
//                 background: DecoratedBox(
//                   position: DecorationPosition.foreground,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.center,
//                         colors: [Colors.teal[800]!, Colors.transparent]),
//                   ),
//                   child: Image.network(
//                       'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/assets/header.jpeg'),
//                 ),
//               ),
//             ),
//             // SliverList(
//             //   delegate: SliverChildBuilderDelegate(
//             //     (context, index) {
//             //       return Card(
//             //         color: Colors.blue,
//             //         shadowColor: Colors.blueGrey,
//             //         child: SizedBox(
//             //           height: 200,
//             //           child: Center(
//             //               child: Text(
//             //             '$index',
//             //             style: TextStyle(fontSize: 40),
//             //           )),
//             //         ),
//             //       );
//             //     },
//             //     childCount: 8,
//             //   ),
//             // ),
//             SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return Card(
//                     color: Colors.blue,
//                     child: SizedBox(
//                       height: 200,
//                       child: Center(
//                         child: Text('${testList[index]}'),
//                       ),
//                     ),
//                   );
//                 },
//                 childCount: 8,
//               ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   const Text('One'),
//                   const Text('Two'),
//                   const Text('Three'),
//                 ],
//               ),
//             ),
//             SliverGrid.count(
//               crossAxisCount: 2,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.orange,
//                     height: 40,
//                     child: const Center(child: Text('Grid one')),
//                   ),
//                 ),
//               ],
//             ),
            // ...List<int>.generate(5, (index) => index).map(
            //   (e) => SliverToBoxAdapter(
            //     child: Container(
            //       height: 100,
            //       color: Colors.red,
            //       margin: const EdgeInsets.symmetric(vertical: 5),
            //     ),
            //   ),
            // ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: StickySliver(
            //     child: Container(
            //       height: 400,
            //       color: Colors.purple,
            //     ),
            //   ),
            // ),
//             ...List<int>.generate(5, (index) => index).map(
//               (e) => SliverToBoxAdapter(
//                 child: Container(
//                   height: 200,
//                   color: Colors.red,
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                 ),
//               ),
//             ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: SecondStickySliver(
            //     child: Container(
            //       height: 400,
            //       color: Colors.yellow,
            //     ),
            //   ),
            // ),
            // ...List<int>.generate(5, (index) => index).map(
            //   (e) => SliverToBoxAdapter(
            //     child: Container(
            //       height: 300,
            //       color: Colors.red,
            //       margin: const EdgeInsets.symmetric(vertical: 5),
            //     ),
            //   ),
            // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RenderStickySliver extends RenderSliverSingleBoxAdapter {
//   RenderStickySliver({RenderBox? child}) : super(child: child);

//   @override
//   void performLayout() {
//     var myCurrentConstraints = constraints;

//     geometry = SliverGeometry.zero;

//     child?.layout(
//       constraints.asBoxConstraints(),
//       parentUsesSize: true,
//     );

//     double childExtent = child?.size.height ?? 0;

//     geometry = SliverGeometry(
//       paintExtent: childExtent,
//       maxPaintExtent: childExtent,
//       // Paint origin is relative to the Sliver's local coordinates, not the
//       // Scroll View.
//       // ScrollOffset is the amount of logical pixels the current sliver box is
//       // scrolled out of view.
//       paintOrigin: constraints.scrollOffset,
//     );

//     // Give all parameters to the renderer

//     setChildParentData(child!, constraints, geometry!);
//   }
// }

// class StickySliver extends SliverPersistentHeaderDelegate {
//   final Widget child;

//   StickySliver({required this.child});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }

//   @override
//   double get maxExtent => 100;

//   @override
//   double get minExtent => 100;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }

// class SecondStickySliver extends SliverPersistentHeaderDelegate {
//   final Widget child;

//   SecondStickySliver({required this.child});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }

//   @override
//   double get maxExtent => 200;

//   @override
//   double get minExtent => 200;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }

//
// Interesting example

// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Collapsing List Demo')),
//         body: CollapsingList(),
//       ),
//     );
//   }
// }
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({
//     @required this.minHeight,
//     @required this.maxHeight,
//     @required this.child,
//   });
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//   @override
//   double get minExtent => minHeight;
//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);
//   @override
//   Widget build(
//       BuildContext context, 
//       double shrinkOffset, 
//       bool overlapsContent) 
//   {
//     return new SizedBox.expand(child: child);
//   }
//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
// class CollapsingList extends StatelessWidget {
//   SliverPersistentHeader makeHeader(String headerText) {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: _SliverAppBarDelegate(
//         minHeight: 60.0,
//         maxHeight: 200.0,
//         child: Container(
//             color: Colors.lightBlue, child: Center(child:
//                 Text(headerText))),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         makeHeader('Header Section 1'),
//         SliverGrid.count(
//           crossAxisCount: 3,
//           children: [
//             Container(color: Colors.red, height: 150.0),
//             Container(color: Colors.purple, height: 150.0),
//             Container(color: Colors.green, height: 150.0),
//             Container(color: Colors.orange, height: 150.0),
//             Container(color: Colors.yellow, height: 150.0),
//             Container(color: Colors.pink, height: 150.0),
//             Container(color: Colors.cyan, height: 150.0),
//             Container(color: Colors.indigo, height: 150.0),
//             Container(color: Colors.blue, height: 150.0),
//           ],
//         ),
//         makeHeader('Header Section 2'),
//         SliverFixedExtentList(
//           itemExtent: 150.0,
//           delegate: SliverChildListDelegate(
//             [
//               Container(color: Colors.red),
//               Container(color: Colors.purple),
//               Container(color: Colors.green),
//               Container(color: Colors.orange),
//               Container(color: Colors.yellow),
//             ],
//           ),
//         ),
//         makeHeader('Header Section 3'),
//         SliverGrid(
//           gridDelegate: 
//               new SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200.0,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             childAspectRatio: 4.0,
//           ),
//           delegate: new SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//               return new Container(
//                 alignment: Alignment.center,
//                 color: Colors.teal[100 * (index % 9)],
//                 child: new Text('grid item $index'),
//               );
//             },
//             childCount: 20,
//           ),
//         ),
//         makeHeader('Header Section 4'),
//         // Yes, this could also be a SliverFixedExtentList. Writing 
//         // this way just for an example of SliverList construction.
//         SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               Container(color: Colors.pink, height: 150.0),
//               Container(color: Colors.cyan, height: 150.0),
//               Container(color: Colors.indigo, height: 150.0),
//               Container(color: Colors.blue, height: 150.0),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// color: Colors.teal[100 * (index % 9)],
