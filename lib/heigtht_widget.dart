import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  int _height = 150;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.teal,
        elevation: 15,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            const Text(
              "Height",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 141, 25, 17),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 141, 25, 17),
                  ),
                )
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              value: _height.toDouble(),
              thumbColor: Colors.red,
              onChanged: (value) {
                setState(
                  () {
                    _height = value.toInt();
                  },
                );
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}
