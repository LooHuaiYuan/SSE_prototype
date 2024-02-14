class Question_Answer {
  String? id;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;

  Question_Answer(
      {this.id,
        this.answer1,
        this.answer2,
        this.answer3,
        this.answer4,
        this.answer5});

  Question_Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer1 = json['answer1'];
    answer2 = json['answer2'];
    answer3 = json['answer3'];
    answer4 = json['answer4'];
    answer5 = json['answer5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer1'] = this.answer1;
    data['answer2'] = this.answer2;
    data['answer3'] = this.answer3;
    data['answer4'] = this.answer4;
    data['answer5'] = this.answer5;
    return data;
  }
}