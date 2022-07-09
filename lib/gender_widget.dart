import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;
  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.green,
      backColor: Colors.teal,
      borderRadius: BorderRadius.circular(30));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.red[50]!,
      backColor: Colors.teal,
      borderRadius: BorderRadius.circular(30));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 1,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/man.png",
                  width: 60,
                  height: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Male",
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            selected: _gender == 2,
            onUnSelected: () {},
            child: Column(
              children: [
                Image.asset(
                  "assets/images/woman.png",
                  width: 60,
                  height: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Female",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
