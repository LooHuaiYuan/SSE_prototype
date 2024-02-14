class Student_Information {
  String? id;
  String? name;
  String? studentId;
  String? faculty;
  String? course;
  String? status;
  String? phoneNumber;

  Student_Information(
      {this.id,
        this.name,
        this.studentId,
        this.faculty,
        this.course,
        this.status,
        this.phoneNumber});

  Student_Information.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['student_id'];
    faculty = json['faculty'];
    course = json['Course'];
    status = json['Status'];
    phoneNumber = json['phone-number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['student_id'] = this.studentId;
    data['faculty'] = this.faculty;
    data['Course'] = this.course;
    data['Status'] = this.status;
    data['phone-number'] = this.phoneNumber;
    return data;
  }
}