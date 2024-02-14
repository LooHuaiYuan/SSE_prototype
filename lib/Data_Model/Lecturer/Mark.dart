class Mark {
  String? id;
  String? mark1;
  String? mark2;
  String? mark3;
  String? mark4;
  String? mark5;

  Mark(
      {this.id, this.mark1, this.mark2, this.mark3, this.mark4, this.mark5});

  Mark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mark1 = json['mark1'];
    mark2 = json['mark2'];
    mark3 = json['mark3'];
    mark4 = json['mark4'];
    mark5 = json['mark5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mark1'] = this.mark1;
    data['mark2'] = this.mark2;
    data['mark3'] = this.mark3;
    data['mark4'] = this.mark4;
    data['mark5'] = this.mark5;
    return data;
  }
}