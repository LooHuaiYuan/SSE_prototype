import 'package:flutter/material.dart';

class Security extends StatefulWidget {

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {

  final List<bool> _isChecked = List.filled(4, false);

  void _onCheckBoxSelected(int index) {
    setState(() {
      _isChecked[index] = !_isChecked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(105, 184, 165, 1.0),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_return),
            iconSize: 40,
            color: const Color.fromRGBO(255, 255, 255, 1.0),
          ),
          title: const Text(
            'Question Bank > Exam > Security Type',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/LecturerHome'));
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
              color: const Color.fromRGBO(255, 255, 255, 1.0),
            ),
          ],
        ),
        body: Center(
            child: Wrap(
              children: [
                Container(
                  height: 500.0,
                  width: 600.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/screen.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 100,
                        child: Container(
                            height: 250.0,
                            width: 400.0,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(105, 184, 165, 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('Webcam Monitoring',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                            const SizedBox(width: 30), // Adjust the width for the desired space
                                            Image.asset(
                                              'images/webcam.jpg',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                        value: _isChecked[0],
                                        onChanged: (value) {
                                          _onCheckBoxSelected(0);
                                        },
                                      ),
                                      const SizedBox(width: 100),
                                      CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('Browser Monitoring',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                            const SizedBox(width: 30), // Adjust the width for the desired space
                                            Image.asset(
                                              'images/browser.jpg',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                        value: _isChecked[1],
                                        onChanged: (value) {
                                          _onCheckBoxSelected(1);
                                        },
                                      ),
                                      const SizedBox(width: 100),
                                      CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('Randomized Questions',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                            const SizedBox(width: 30), // Adjust the width for the desired space
                                            Image.asset(
                                              'images/random.jpg',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                        value: _isChecked[2],
                                        onChanged: (value) {
                                          _onCheckBoxSelected(2);
                                        },
                                      ),
                                      const SizedBox(width: 100),
                                      CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('Plagiarism Detection',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                            const SizedBox(width: 30), // Adjust the width for the desired space
                                            Image.asset(
                                              'images/plagiarism.jpg',
                                              height: 30,
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                        value: _isChecked[3],
                                        onChanged: (value) {
                                          _onCheckBoxSelected(3);
                                        },
                                      ),
                                    ]
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
