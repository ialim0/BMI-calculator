import 'dart:math';

import 'package:bmi/age_widget.dart';
import 'package:bmi/gender_widget.dart';
import 'package:bmi/heigtht_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:bmi/scrore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 56, 51),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "BMI calculator",
          style: GoogleFonts.aBeeZee(fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                GenderWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    _height = heightVal;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWidget(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        title: 'Age',
                        initValue: 20,
                        min: 10,
                        max: 100),
                    AgeWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: 'Weight',
                        initValue: 45,
                        min: 10,
                        max: 200),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                    isFinished: _isFinished,
                    onFinish: () async {
                      await Navigator.push(
                          context,
                          PageTransition(
                              child: ScoreScreen(
                                bmiScore: _bmiScore,
                                age: _age,
                              ),
                              type: PageTransitionType.fade));
                      setState(() {
                        _isFinished = false;
                      });
                    },
                    onWaitingProcess: () {
                      calculateBmi();
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          _isFinished = true;
                        });
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    buttonText: "Calculate",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
