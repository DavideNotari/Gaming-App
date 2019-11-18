import 'package:flutter/material.dart';

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 1,
    );
    // TODO: implement build
    return new PageView(
      controller: controller,
      children: <Widget>[_mainNewsWidget(), _teamNewsWidget()],
    );
  }
}

Widget _mainNewsWidget() {
  return new Padding(
      padding: EdgeInsets.all(15.0), child: AnimatedContainerApp());
}

Widget _teamNewsWidget() {
  return new Text("Helloooooooooo");
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 400;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: const Card(child: Text('Hello World!')),

        ///title not necessary
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          child: GestureDetector(
              child: Image.network(
                  "http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png"),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  if(details.delta.dy > 0){
                    _height = 300;
                    print("down" + details.delta.dy.toString());
                  }
                  else{
                    _height =100;
                    print("up");
                  }
                  // Generate a random width and height.
                });
              }),
        ),
      ),
      Expanded(
          child: ListView(
        children: const <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      ))
      /**Image(
              image://url,
              ),**/
    ]));
  }
}
