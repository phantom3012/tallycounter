import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tally = 0;
  Color _color = Colors.indigo[200];

  addTally() {
    setState(() {
      _tally = _tally + 1;
    });
  }

  subtractTally() {
    setState(() {
      _tally = _tally - 1;
    });
  }

  resetTally() {
    setState(() {
      _tally = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColour() {
      if (_tally > 0) {
        _color = Colors.green[300];
      } else if (_tally < 0) {
        _color = Colors.red[300];
      } else {
        _color = Colors.indigo[200];
      }
    }

    getColour();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tally Counter'),
      ),
      body: Stack(children: [
        AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          duration: Duration(seconds: 2),
          color: _color,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_tally',
                style: TextStyle(fontSize: 80),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: subtractTally,
                    child: Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: resetTally,
                    child: Text('Reset'),
                  ),
                  FloatingActionButton(
                    onPressed: addTally,
                    child: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
