import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sse_prototype/Data_Model/Lecturer/Lecturer_Authentication.dart';
import 'package:http/http.dart' as http;
import 'Data_Model/Student/Student_Authentication.dart';

enum UserType { student, lecturer }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Fetch data for lecturer authentication
  List<Lecturer_Authentication> L_authentication = [];

  Future<List<Lecturer_Authentication>> fetch_L_Authentication() async {

    List<Lecturer_Authentication> data = [];
    var url = 'http://localhost:3000/Lecturer_authentication';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var urjson = json.decode(response.body);

      for(var jsondata in urjson){
        data.add(Lecturer_Authentication.fromJson(jsondata));
      }
    }
    return data;
  }

  //Fetch data for student authentication
  List<Student_Authentication> S_authentication = [];

  Future<List<Student_Authentication>> fetch_S_Authentication() async {

    List<Student_Authentication> data = [];
    var url = 'http://localhost:3000/Student_authentication';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var urjson = json.decode(response.body);

      for(var jsondata in urjson){
        data.add(Student_Authentication.fromJson(jsondata));
      }
    }
    return data;
  }

  @override
  void initState(){
    fetch_L_Authentication().then((value) {
      setState(() {
        L_authentication.addAll(value);
      });
    });
    fetch_S_Authentication().then((value) {
      setState(() {
        S_authentication.addAll(value);
      });
    });
    super.initState();
  }

  UserType selectedUserType = UserType.student;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() {
    // Implement your login logic here
    String username = usernameController.text;
    String password = passwordController.text;

    String? id;
    String? passwordCheck;
    bool? success;
    if(selectedUserType == UserType.lecturer) {
      for(var data in L_authentication){
        if(username == data.userId){
          passwordCheck = data.password;
          id = data.id.toString();
          break;
        }
      }
      if(password == passwordCheck){
        Navigator.pushNamed(context, '/LecturerHome', arguments: {'ID': id});
      }else{
        success = false;
      }
    } else {
      for(var data in S_authentication){
        if(username == data.userId){
          passwordCheck = data.password;
          id = data.id.toString();
          break;
        }
      }
      if(password == passwordCheck){
        Navigator.pushNamed(context, '/StudentHome', arguments: {'ID': id});
      }else{
        success = false;
      }
    }
    // Check username and password (dummy logic for demonstration)
    if (success == false) {
      // Show an error message or perform other actions
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black, // Set the background color of AlertDialog
          content: Stack(
            children: [
              Container(
                child: Transform.translate(
                  offset: Offset(80.0, 10.0), // Adjust the Y offset for both "Login" and "Error"
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white, // Set the text color
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0), // Add space between "Login" and "Error" texts
                      Text(
                        'Error',
                        style: TextStyle(
                          color: Colors.white, // Set the text color
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -1,
                right: -3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white, // Set the icon color
                  ),
                ),
              ),
            ],
          ),
          actions: [],
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(105, 184, 165, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Transform.translate(
          offset: Offset(250.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                child: Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 550.0,
                  color: Color.fromRGBO(255, 255, 255, 0.65),
                  child: Text(
                    'LOGIN PAGE',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Transform.translate(
                offset: Offset(0.0, -50.0),
                child: Container(
                  height: 500.0,
                  width: 1000.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(209, 244, 238, 0.7),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(150.0, 70.0),
                        child: Row(
                          children: [
                            Container(
                              height: 110.0,
                              width: 110.0,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(105, 184, 165, 1.0),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Icon(Icons.person, color: Colors.black, size : 80),
                            ),
                            SizedBox(width: 60),
                            Container(
                              height: 80.0,
                              width: 500.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350], // Set the background color of the dropdown button
                                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius
                                    ),
                                    alignment: Alignment.center,
                                    child : DropdownButton<UserType>(
                                      value: selectedUserType,
                                      onChanged: (UserType? value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedUserType = value;
                                          });
                                        }
                                      },
                                      style : TextStyle (
                                        color: Colors.black,
                                      ),
                                      items: UserType.values.map((UserType userType) {
                                        return DropdownMenuItem<UserType>(
                                          value: userType,
                                          child: Text(userType == UserType.student ? 'S' : 'L'),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: TextField(
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        labelText: 'User ID (${selectedUserType == UserType.student ? 'Student' : 'Lecturer'})',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Transform.translate(
                        offset: Offset(150.0, 100.0),
                        child: Row(
                          children : [
                            Container (
                              height: 110.0,
                              width: 110.0,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(105, 184, 165, 1.0),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Icon(Icons.lock, color: Colors.black, size : 80),
                            ),
                            SizedBox(width: 60),
                            Container (
                              height: 80.0,
                              width: 500.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Transform.translate(
                        offset: Offset(0.0, 130.0),
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0, 215, 125, 0.5),
                            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                          ),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }





}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Text('Welcome to the Home Screen!'),
            ),
        );
    }
}
