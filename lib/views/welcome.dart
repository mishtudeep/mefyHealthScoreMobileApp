import 'package:flutter/material.dart';
import 'package:health_score_app/views/form.dart';

class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController _usenameController = TextEditingController();

  bool isValidEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: Color(0XFFEFF3F6),
        body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(left:18.0,right: 18.0, top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Welcome to Mefy Health Score App", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900
                ),),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFEFF3F6),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0
                      )
                    ]
                  ),
                  child: TextField(
                    controller: _usenameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Enter Your Email to continue",
                      contentPadding: const EdgeInsets.all(20.0)
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          onPressed: () {                          
                            if(isValidEmail(_usenameController.text)) {
                              Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => HealthScoreForm(userId: _usenameController.text,)));
                            } else {
                              showDialog(context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Input Error"),
                                content:Text("The entered email ID: "+_usenameController.text+" is not a valid Email Address. Please provide a valid Email ID to proceed"),
                                actions: <Widget>[
                                  FlatButton(child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },)
                                ]
                              )
                              );
                            }
                          },
                          child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child:
                              Text("Continue", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                                )
                              )
                            ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[600],
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(6, 2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(-6, -2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0
                              )
                            ]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        )
      )
      
    );
  }
}