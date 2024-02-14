import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(105, 184, 165, 1.0),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: const Color.fromRGBO(255, 255, 255, 1.0),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: const Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ],
      ),
      body: Wrap(
        children: [
          Container(
            color: const Color.fromRGBO(105, 184, 165, 0.5),
            width: 200.0,
            height: 1200.0,
            child: const Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      'Account',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(height: 20.0, thickness: 1, color: Colors.black),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      'Question Bank',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(height: 20.0, thickness: 1, color: Colors.black),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      'Assessment',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(height: 20.0, thickness: 1, color: Colors.black),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(height: 20.0, thickness: 1, color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(150.0),
            child: Container(
              height: 500.0,
              width: 1000.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 0.8),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person),
                  Column(
                    children: [
                      Text('Name:'),
                      Text('Student ID:'),
                      Text('Faculty:'),
                      Text('Course:'),
                      Text('Status:'),
                      Text('Phone Number'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}