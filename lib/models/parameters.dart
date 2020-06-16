class Parameters {
  String username;
  String age;
  String gender;
  String weight;
  String height;
  String heartrate;
  String bloodpressuresys;
  String bloodpressuredia;
  String cholestrol;
  String avgbloodsugar;
  String alcoholconsumptiondaily;
  String alocholconsumptionweekly;
  String smoker;

  Parameters({this.username, this.age, this.gender, this.weight, this.height, this.heartrate, this.bloodpressuresys, this.bloodpressuredia,
  this.cholestrol, this.avgbloodsugar, this.alcoholconsumptiondaily, this.alocholconsumptionweekly, this.smoker});

  Map<String, dynamic> toJson() {
    return {
      "username": this.username,
      "age": this.age,
      "gender": this.gender,
      "weight": this.weight,
      "height": this.height,
      "heartrate": this.heartrate,
      "bloodpressuresys": this.bloodpressuresys,
      "bloodpressuredia": this.bloodpressuredia,
      "cholestrol": this.cholestrol,
      "avgbloodsugar": this.avgbloodsugar,
      "alcoholconsumptiondaily": this.alcoholconsumptiondaily,
      "alocholconsumptionweekly": this.alocholconsumptionweekly,
      "smoker": this.smoker

    };
  }
}