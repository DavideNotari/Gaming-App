import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: MainPageScaffold(),
    );
  }
}

class MainPageScaffold extends StatefulWidget {
  @override
  MainPageScaffoldState createState() => MainPageScaffoldState();
}

class MainPageScaffoldState extends State<MainPageScaffold> {
  final _suggestions = <WordPair>[];
  int number = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(3.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('Team Name'),
              Row(children: <Widget>[
                Container(
                    width: 100.0,
                    height: 100.0,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(50.0),
                      child: Image(
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        height: 100.0,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(children: <Widget>[
                      Text("Info about team "),
                      Text("Subtitle"),
                    ])),
              ]),
              Expanded(
                child: _buildUserRows(),
              ),
            ],
            //children: //_buildSuggestions(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          //codice per aggiungere
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildUserRows() {
    return ListView.builder(
        //codice da rivedere
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    int player;
    return ListTile(
        leading: _iconRow(),
        title: const Text('Player'),
        subtitle:
            player == null ? const Text('player number not found') : player,
        contentPadding: const EdgeInsets.all(10.0),
        onTap: () {});
  }

  Widget _iconRow() {
    return Icon(
      Icons.android,
      color: Colors.green,
      size: 30.0,
    );
  }
}
