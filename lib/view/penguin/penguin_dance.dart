import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mobility_bu/utills/constant_value.dart';

class PenguinDance extends StatefulWidget {
  const PenguinDance({super.key});

  @override
  State<PenguinDance> createState() => _PenguinDanceState();
}

class _PenguinDanceState extends State<PenguinDance> {
  double _rockAmount = 0.5;
  double _speed = 1.0;
  double _rockTime = 0.0;
  bool _isPaused = false;
  var isPlaying = false;

  ActorAnimation? _rock;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("music_walk");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rockTime += elapsed * _speed;
    _rock!.apply(_rockTime % _rock!.duration, artboard, _rockAmount);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //appBar: new AppBar(title: new Text(widget.title)),
      body: Stack(
        children: [
          penguin(),
          pause(),
        ],
      ),
    );
  }

  Widget penguin() {
    return Positioned.fill(
        child: FlareActor(
      PENGUIN_FILE,
      alignment: Alignment.center,
      isPaused: isPlaying,
      fit: BoxFit.cover,
      animation: "walk",
      //controller: this
    ));
  }

  Widget pause() {
    return Positioned.fill(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(PAUSE, style: TextStyle(color: Colors.white)),
              IconButton(
                  icon: isPlaying
                      ? const Icon(
                          Icons.play_circle_outline,
                          size: 40.0,
                        )
                      : const Icon(Icons.pause_circle_outline, size: 40.0),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  }),
            ],
          )),
    ]));
  }
}
