import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mobility_bu/utills/constant_value.dart';

import '../../Controller/smiley_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rating = 5.0;
  String _currentAnimation = '5+';
  final SmileyController _smileyController = SmileyController();

  void _onChanged(double value) {
    if (_rating == value) return;

    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentAnimation = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          FLARE_APP_BAR,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/happiness_emoji.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                controller: _smileyController,
                animation: _currentAnimation,
              ),
            ),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: _onChanged,
            ),
            Text(
              '$_rating',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
