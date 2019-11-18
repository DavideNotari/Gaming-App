import 'package:flutter_app/team_fragment.dart';
import 'package:flutter_app/news_fragment.dart';
import 'package:flutter_app/social_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  //To change page add here
  final drawerItems = [
    new DrawerItem("Notizie", Icons.style),
    new DrawerItem("Team", Icons.supervisor_account),
    new DrawerItem("Social", Icons.face)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}


//General Code to change page
class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new SecondFragment();
      case 1:
        return new FirstFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // closes the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName:
                new Text("Prova"),
                accountEmail: Text("prova@notreal.com")
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex)
    );
  }
}

