import 'package:flutter/material.dart';

class SnapAppBar extends StatelessWidget {
  const SnapAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "./imgs/sea.png",
                    fit: BoxFit.cover,
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList.builder(
                itemCount: 100,
                itemBuilder: (context, index) => Text('Item $index'),
              )
            ],
          );
        }),
      ),
    );
  }
}
