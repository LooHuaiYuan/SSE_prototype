class Exam_Question111 {
  String? id;
  String? question1;
  String? question2;
  String? question3;
  String? question4;
  String? question5;

  Exam_Question111(
      {this.id,
        this.question1,
        this.question2,
        this.question3,
        this.question4,
        this.question5});

  Exam_Question111.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question1 = json['question1'];
    question2 = json['question2'];
    question3 = json['question3'];
    question4 = json['question4'];
    question5 = json['question5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question1'] = this.question1;
    data['question2'] = this.question2;
    data['question3'] = this.question3;
    data['question4'] = this.question4;
    data['question5'] = this.question5;
    return data;
  }
}