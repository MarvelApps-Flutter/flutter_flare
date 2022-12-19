import 'package:flutter/material.dart';
import 'package:mobility_bu/utills/constant_value.dart';
import 'teddy/teddy_home.dart';
import 'happy_emoji/happiness_emoji.dart';
import 'penguin/penguin_dance.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(
              text: HAPPY_EMOJI,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const MyHomePage()));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Button(
              text: PENGUIN_DANCE,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const PenguinDance()));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Button(
              text: TEDDY,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const TeddyHome()));
              },
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.text,
    required this.press,
  }) : super(key: key);
  final String? text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => press(), child: Text(text!));
  }
}
