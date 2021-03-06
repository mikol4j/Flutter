import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //prefixing an identifier with an underscore enforces privacy in the Dart language.
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  //   @override
  // Widget build(BuildContext context) {
  //   final wordPair = new WordPair.random();
  //   return new Text(wordPair.asPascalCase);
  // }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.settings), onPressed: _settings),
        ],
      ),
      
      body: _buildSuggestions(),
    );
  }
  void _settings() {
  Navigator.of(context).push(
       new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(
                "just another a/an " + pair.asLowerCase,
              ),
            );
          },
        );
        final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();
                  return new Scaffold(
          appBar: new AppBar(
            title: new Text('Settings'),
          ),
          body: new ListView(children: divided),
        );
      },
    ),
  );
}
void _pushSaved() {
  Navigator.of(context).push(
       new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
                  return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      },
    ),
  );
}
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return new Divider();

          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView,
          // minus the divider widgets.
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite: Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = new WordPair.random();
//     return new MaterialApp(
//       title: 'Welcome to Flutter',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Welcome to Flutter'),
//         ),
//         body: new Center(
//           //1.//child: new Text('Hello World'),
//           //2.//child: new Text(wordPair.asPascalCase),
//           child: new RandomWords(),
//         ),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      
      home: new RandomWords(),
    );
  }
}
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new HellloWidget(title:"hello world");
//   }
// }

// class HellloWidget extends StatelessWidget {
//   final String title;
//   HellloWidget({this.title});
//   @override
//   Widget build(BuildContext ctx) {
//     return new Center(child:
//     new MaterialApp(
//       title: 'Welcome to Flutter...',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title:  new Center(child: new Text('PentaKOP', style:new TextStyle(fontSize: 24.0))),
//         ),
//         body: new Center(
//           child: new Text(this.title),
//         ),
//       ),
//     ));
//   }
// }
