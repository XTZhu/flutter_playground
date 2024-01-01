import 'package:flutter/material.dart';
import 'package:flutter_playground/delegate/SliverHeaderDelegate.dart';

class MyNestedScrollView extends StatelessWidget {
  const MyNestedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Nested Scroll View'),
                  background: Image.network(
                    'https://scontent.cdninstagram.com/v/t39.30808-6/415865207_18416149624005496_5067081940893110165_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=vLFnGFnWWD8AX9jxqEj&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzI3MDQ3MjE5ODgyMzY4NzMxOQ%3D%3D.2-ccb7-5&oh=00_AfAwkzyhSj2Gii-pR1uWoSCrOKturQaUo5GEqNb8mDbRmQ&oe=6597F9F4&_nc_sid=10d13b',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                    ],
                  ),
                ),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                  //有最大和最小高度
                  maxHeight: 180,
                  minHeight: 50,
                  child: YourHorizontalScrollWidget(),
                ),
              ),
              SliverFixedExtentList.builder(
                itemExtent: 30,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
              SliverFillRemaining(
                  child: TabBarView(children: [
                ListView.builder(
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Text('Item 1050 ti$index');
                  },
                ),
                Text('456')
              ])),
              // Rest of your content for the second tab
              // GridView(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     childAspectRatio: 1.0,
              //   ),
              //   children: const <Widget>[
              //     Icon(Icons.ac_unit),
              //     Icon(Icons.airport_shuttle),
              //     Icon(Icons.all_inclusive),
              //     Icon(Icons.beach_access),
              //     Icon(Icons.cake),
              //     Icon(Icons.free_breakfast)
              //   ],
              // ),
            ],
          )),
    );
  }
}

class YourHorizontalScrollWidget extends StatelessWidget {
  const YourHorizontalScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 20,
      constraints: const BoxConstraints(maxHeight: 20),
      child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123')),
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123')),
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123')),
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123')),
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123')),
              Padding(padding: EdgeInsets.only(right: 80), child: Text('123'))
            ],
          )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SliverAppPickerDelegate extends SliverPersistentHeaderDelegate {
  final Widget _widget;

  _SliverAppPickerDelegate(this._widget);

  @override
  double get minExtent => 20;

  @override
  double get maxExtent => 20;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _widget;
  }

  @override
  bool shouldRebuild(_SliverAppPickerDelegate oldDelegate) {
    return false;
  }
}
