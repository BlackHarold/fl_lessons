import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsBoxFavorite extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavorite(this._num, this._like);

  @override
  State<StatefulWidget> createState() {
    return NewsBoxFavoriteState(_num, _like);
  }
}

class NewsBoxFavoriteState extends State {
  int num;
  bool like = false;

  NewsBoxFavoriteState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if (like)
        num++;
      else
        num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'В избранном\n$num',
          textAlign: TextAlign.center,
        ),
        IconButton(
          icon: Icon(
            like ? Icons.star : Icons.star_border,
            size: 30.0,
            color: Colors.blue,
          ),
          onPressed: pressButton,
        )
      ],
    );
  }
}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

//  NewsBox(this._title, this._text, {String imageurl}) {
//    _imageurl = imageurl;
//  }

  NewsBox(this._title, this._text,
      {String imageurl, int num = 0, bool like = false}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null) {
      return Container(
        color: Colors.grey,
        height: 100.0,
        child: Row(
          children: <Widget>[
            Image.network(
              _imageurl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          _title,
                          style: TextStyle(fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                            child: Text(
                          _text,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ))
                      ],
                    ))),
            NewsBoxFavorite(_num, _like)
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.grey,
        height: 100.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          _title,
                          style: TextStyle(fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                            child: Text(
                          _text,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ))
                      ],
                    ))),
            NewsBoxFavorite(_num, _like)
          ],
        ),
      );
    }
  }
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(),
      body: NewsBox(
        'title',
        'text2',
        imageurl: 'https://flutter.su/favicon.png',
        like: true,
        num: 101,
      ),
    )));
