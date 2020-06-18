import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_score_app/models/parameters.dart';
import 'package:health_score_app/services/healthscoreservice.dart';
import 'package:health_score_app/views/healthtips.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Result extends StatefulWidget {
  final Parameters params;
  Result({this.params});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  HealthScoreService get healthScoreService => GetIt.I<HealthScoreService>();
  bool _isLoading = false;
  var score='';
  var scorecomment='';
  var rList=[];

  @override
  void initState() {
    super.initState();
    setState(() {
      _getScore();
    });
  }

  

  _getScore() async{

    setState(() {
      _isLoading = true;
    });
    final d = await healthScoreService.getHealthScore(widget.params);
    var jsonData = json.decode(d.data);
    
    setState(() {
      this.score = jsonData['score'].toString();
      if(jsonData['score'] >= 80){
        scorecomment = "You are doing very good";
      } else if(jsonData['score'] >= 60 && jsonData['score'] < 80){
        scorecomment = "Your health score is average";
      } else if(jsonData['score'] >= 40 && jsonData['score'] < 60) {
        scorecomment = "You are not doing well take care";
      }
      else if(jsonData['score'] < 40) {
        scorecomment = "Your health score is very low follow the health tips";
      }
      
      this.rList = jsonData['recommendations'];

    });
    
    

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeuAppBar(title: Text("Health Score", style: TextStyle(
        height: 1
      ),),),
      body: SingleChildScrollView(
        child: Builder(builder: (_){
          if(_isLoading) {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.purple[900],
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation(Colors.pink),
                )),
              ));
          } else {
           return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50,),
                NeuCard(
                  curveType: CurveType.emboss,
                  bevel: 20,
                  padding: const EdgeInsets.all(20),
                  decoration: NeumorphicDecoration(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: CircularPercentIndicator(
                    radius: 130,
                    lineWidth: 13,
                    animation: true,
                    percent: this.score != '' ? double.parse(this.score)/100 : 0.0,
                    center: Text(this.score,
                    style: TextStyle(color: this.score != '' ? (double.parse(this.score) >= 75 ? Colors.green : ((double.parse(this.score) >= 50) ? Colors.orange :Colors.red)) :Colors.black,
                    fontSize: 30,
                    ),),
                    footer: Text(this.scorecomment,
                    style: TextStyle(
                      color: this.score != '' ? (double.parse(this.score) >= 75 ? Colors.green : ((double.parse(this.score) >= 50) ? Colors.orange :Colors.red)) :Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: this.score != '' ? (double.parse(this.score) >= 75 ? Colors.green : ((double.parse(this.score) >= 50) ? Colors.orange :Colors.red)) :Colors.black,
                    )),
                    SizedBox(height: 50,),
                    NeuButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HealthTips(recommendList: this.rList,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\u2661 Check out your Health Tips!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.pink[400],
                      ),),
                    )),
                    SizedBox(height: 30,),
              ],
            ),
          ),
        );
          }
        })
      ),
      
    );
  }
}

