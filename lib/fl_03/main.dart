import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyBodyState();
}

class MyBodyState extends State {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      print('num $i : нечетное = ${i.isOdd}');
      if (i.isOdd) return Divider();
      final int index = i ~/ 2;

      if (index >= _array.length) {
        print('index $index');
        print('legnth ${_array.length}');
        _array.addAll(['${index + 1}', '${index + 2}', '${index + 3}']);
      }
      return ListTile(
        title: Text('${index + 1}'),
      );
    }); //ListVies.builder
  }
}

List<Widget> myList = [
  Text('element 1'),
  Divider(),
  Text('element 2'),
  Divider(),
  Text('element 3'),
  Divider()
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyBody(),
      ),
    ));
