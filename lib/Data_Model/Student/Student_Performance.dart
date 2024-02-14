class Student_Performance {
  String? name;
  String? timeSpent;
  String? overallScores;
  String? q1;
  String? q2;
  String? q3;
  String? data1;
  String? data2;
  String? data3;
  String? data4;
  String? data5;

  Student_Performance(
      {this.name,
        this.timeSpent,
        this.overallScores,
        this.q1,
        this.q2,
        this.q3,
        this.data1,
        this.data2,
        this.data3,
        this.data4,
        this.data5});

  Student_Performance.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    timeSpent = json['timeSpent'];
    overallScores = json['overallScores'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    data1 = json['data1'];
    data2 = json['data2'];
    data3 = json['data3'];
    data4 = json['data4'];
    data5 = json['data5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['timeSpent'] = this.timeSpent;
    data['overallScores'] = this.overallScores;
    data['q1'] = this.q1;
    data['q2'] = this.q2;
    data['q3'] = this.q3;
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    data['data4'] = this.data4;
    data['data5'] = this.data5;
    return data;
  }
}