import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class HealthTips extends StatefulWidget {

  final recommendList;
  HealthTips({this.recommendList});
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeuAppBar(title: Text('Health Tips', style: TextStyle(
        height: 1,
        color: Colors.blue[900],
      ),)),
      body: ListView.separated(
        separatorBuilder: (_, __)=> SizedBox(height: 25),
        padding: EdgeInsets.all(10),
        itemCount: widget.recommendList.length, 
        itemBuilder: (_,index) {
        return NeuCard(
          curveType: CurveType.concave,
          decoration: NeumorphicDecoration(
    borderRadius: BorderRadius.circular(10)
  ), 
          child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('\u2665 '+widget.recommendList[index].split(':')[0], style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5,),
              Text(widget.recommendList[index].split(':')[1].trim(), style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold
              ),), 
            ],
          ),
        ));
      })
    );
  }
}