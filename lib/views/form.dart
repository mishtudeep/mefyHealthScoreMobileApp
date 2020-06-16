import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_score_app/models/parameters.dart';
import 'package:health_score_app/views/result.dart';

class HealthScoreForm extends StatefulWidget {

  final String userId;
  HealthScoreForm({this.userId});

  @override
  _HealthScoreFormState createState() => _HealthScoreFormState();
}

class _HealthScoreFormState extends State<HealthScoreForm> {

  String _genderDropdownValue;
  String _smokerDropdownValue;
  TextEditingController _ageController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _heartRateController = TextEditingController();
  TextEditingController _bloodpressuresysController = TextEditingController();
  TextEditingController _bloodpressurediaController = TextEditingController();
  TextEditingController _cholestrolController = TextEditingController();
  TextEditingController _avgbloodsugarController = TextEditingController();
  TextEditingController _alcoholconsumptiondailyController = TextEditingController();
  TextEditingController _alocholconsumptionweeklyController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Welcome, "+widget.userId.split("@")[0], style: TextStyle(
          color: Colors.white
        ),)
      ),
      body: SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.all(12.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Age", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(6, 2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              ),
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                offset: Offset(-6, -2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              )
            ]
          ),
                  child: TextField(
          controller: _ageController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            border: InputBorder.none,
            hintText: 'Please Enter Your Age'
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Gender",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Row(
                  children: <Widget>[
          Expanded(
              child: Container(
              padding: EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top:5),
              decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _genderDropdownValue,
                underline: Container(height: 0,),
                hint: Text("Select your gender"),
                items: <String>['male', 'female'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                    );
                }).toList(), 
                onChanged: (String newVal){
                  setState(() {
                    _genderDropdownValue = newVal;
                  });
                })
            ),
          ),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Weight (In Kg)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(6, 2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              ),
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                offset: Offset(-6, -2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              )
            ]
          ),
                  child: TextField(
          controller: _weightController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            border: InputBorder.none,
            hintText: 'Please Enter Your Weight'
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Height (in Feet)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(6, 2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              ),
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                offset: Offset(-6, -2),
                blurRadius: 2.0,
                spreadRadius: 2.0
              )
            ]
          ),
                  child: TextField(
          controller: _heightController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            border: InputBorder.none,
            hintText: 'Please Enter Your Height'
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Heart Rate", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _heartRateController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Please Enter Your Heart Rate'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Systolic Blood Pressure", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _bloodpressuresysController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Please Enter Your Systolic Blood Pressure'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Diastolic Blood Pressure", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _bloodpressurediaController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Please Enter Your Diastolic Blood Pressure'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Cholesterol (mg/dL)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _cholestrolController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Please Enter Your Cholesterol'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Average Blood Sugar (mg/dL)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _avgbloodsugarController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Enter Average Blood Sugar'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Daily Alcohol Consumption (glasses)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _alcoholconsumptiondailyController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Enter Your Daily Alcohol consumption'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Weekly Alcohol Consumption (glasses)", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
                        child: TextField(
                controller: _alocholconsumptionweeklyController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: InputBorder.none,
                  hintText: 'Enter Your Weekly Alcohol Consumption'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Do you smoke?", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Row(
                  children: <Widget>[
          Expanded(
              child: Container(
              padding: EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top:5),
              decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                  ]
                ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _smokerDropdownValue,
                underline: Container(height: 0,),
                hint: Text("Choose an option"),
                items: <String>['yes', 'no'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                    );
                }).toList(), 
                onChanged: (String newVal){
                  setState(() {
                    _smokerDropdownValue = newVal;
                  });
                })
            ),
          ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(children: <Widget>[
                  Expanded(child: FlatButton(
                    onPressed: (){
                      final params = Parameters(
                        username: widget.userId,
                        age: _ageController.text,
                        gender: _genderDropdownValue,
                        weight: _weightController.text,
                        height: _heightController.text,
                        heartrate: _heartRateController.text,
                        bloodpressuresys: _bloodpressuresysController.text,
                        bloodpressuredia: _bloodpressurediaController.text,
                        cholestrol: _cholestrolController.text,
                        avgbloodsugar: _avgbloodsugarController.text,
                        alcoholconsumptiondaily: _alcoholconsumptiondailyController.text,
                        alocholconsumptionweekly: _alocholconsumptionweeklyController.text,
                        smoker: _smokerDropdownValue
                      );
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Result())
                      );
                    }, 
                    child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child:
                            Text("Calculate Health Score", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                              )
                            )
                          ),
                        decoration: BoxDecoration(
                          color: Colors.pink[600],
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 2.0,
                              spreadRadius: 2.0
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                              offset: Offset(-6, -2),
                              blurRadius: 2.0,
                              spreadRadius: 2.0
                            )
                          ]
                        ),
                      ),),
                    )
                ],)
              ],
            ),
        ),
      ),

    );
  }
}