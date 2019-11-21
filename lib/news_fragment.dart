import 'package:flutter/material.dart';

final controller = PageController(
  initialPage: 0,
);

List <String> images = ["http://www.dacoromania.org/upload/o/71/712227_wolf-png-logo.png","https://www.pinclipart.com/picdir/middle/423-4232536_esport-call-of-duty-team-esport-logo-png.png"];

class SecondFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );
    return new PageView(
      controller: controller,
      children: <Widget>[_mainNewsWidget(), _mainNewsWidget()],
    );
  }
}

Widget _mainNewsWidget() {

  return new Padding(
      padding: EdgeInsets.all(15.0), child: AnimatedContainerApp());
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
              child: Image.network(images[1]),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  print(controller.toString());
                  if(details.delta.dy > 0){
                    _height = 300;
                  }
                  else{
                    _height =100;
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
