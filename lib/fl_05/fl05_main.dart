import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primary window'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => SecondScreen()));
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Open second window'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second/123');
            },
            child: Text('Open second window'),
          ),
        ],
      )),
    );
  }
}*/

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('More or less'),
      ),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
              onPressed: () async {
                bool value = await Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => MyPopup(),
                        transitionsBuilder: (___, Animation<double> animation,
                            ____, Widget child) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                          );
                        }));

                if (value)
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('More'),
                    backgroundColor: Colors.green,
                  ));
                else
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Less'),
                    backgroundColor: Colors.red,
                  ));
              },
              child: Text('Pick a number between one and one hundred')),
        ],
      )),
    );
  }
}

/*class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secondary window $_id'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Open first window'),
        ),
      ),
    );
  }
}*/

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your answer:'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('More'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text('Less'),
        ),
      ],
    );
  }
}

/*void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainScreen(),
        '/second': (BuildContext context) => SecondScreen()
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name.split('/');
        if (path[1] == 'second') {
          return MaterialPageRoute(
              builder: (context) => SecondScreen(id: path[2]),
              settings: routeSettings);
        }
      },
    ));*/

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()));
