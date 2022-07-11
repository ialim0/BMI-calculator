import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final initValue;
  final int min;
  final int max;
  const AgeWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 15,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 141, 25, 17),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
