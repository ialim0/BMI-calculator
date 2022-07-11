import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiInterpretation;
  String? bmiStatus;
  Color? bmiStatusColor;

  ScoreScreen({
    Key? key,
    required this.bmiScore,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "BMI Score",
          style: GoogleFonts.aBeeZee(fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fitness.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Card(
          color: Colors.teal,
          elevation: 15,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Score ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment(
                    'UnderWeight',
                    18.5,
                    Colors.red,
                  ),
                  GaugeSegment(
                    'Normal',
                    6.4,
                    Colors.green,
                  ),
                  GaugeSegment(
                    'OverderWeight',
                    5,
                    Colors.orange,
                  ),
                  GaugeSegment(
                    'Obese',
                    10.1,
                    Colors.pink,
                  ),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 40),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.yellow,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bmiStatus!,
                style: TextStyle(fontSize: 20, color: bmiStatusColor!),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bmiInterpretation!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Re-calculate"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Share.share(
                          "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age ");
                    },
                    child: const Text("Share"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 30) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy,you are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
