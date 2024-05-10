import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';

import 'home.dart';


class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  _TabsPageState createState() => _TabsPageState();
}



class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: const Text('Dashboard'),
      ),
      body: GFTabBarView(controller: tabController, children: <Widget>[
        const MyHomePage(title: "Hi Raksha!"),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ]),
      bottomNavigationBar: GFTabBar(
        tabBarColor: Colors.transparent,
        length: 4,
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.directions_bike),
            child: Text(
              'Home',
            ),
          ),
          Tab(
            icon: Icon(Icons.directions_bus),
            child: Text(
              'Routine',
            ),
          ),
          Tab(
            icon: Icon(Icons.directions_railway),
            child: Text(
              'Explore',
            ),
          ),
          Tab(
            icon: Icon(Icons.directions_railway),
            child: Text(
              'Tools',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}