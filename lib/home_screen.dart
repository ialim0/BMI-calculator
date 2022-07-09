import 'package:bmi/age_widget.dart';
import 'package:bmi/gender_widget.dart';
import 'package:bmi/heigtht_widget.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI calculator",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
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
                        initValue: 30,
                        min: 30,
                        max: 100),
                    AgeWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: 'Weight',
                        initValue: 50,
                        min: 50,
                        max: 200),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                    isFinished: _isFinished,
                    onFinish: () {
                      setState(() {
                        _isFinished = false;
                      });
                    },
                    onWaitingProcess: () {
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
}
