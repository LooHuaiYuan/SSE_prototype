class Lecturer_Information {
  String? name;
  String? lecturerId;
  String? position;
  String? department;
  String? faculty;
  String? status;
  String? phoneNumber;
  String? id;

  Lecturer_Information(
      {this.name,
        this.lecturerId,
        this.position,
        this.department,
        this.faculty,
        this.status,
        this.phoneNumber,
        this.id});

  Lecturer_Information.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lecturerId = json['lecturer_id'];
    position = json['position'];
    department = json['department'];
    faculty = json['faculty'];
    status = json['Status'];
    phoneNumber = json['phone-number'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lecturer_id'] = this.lecturerId;
    data['position'] = this.position;
    data['department'] = this.department;
    data['faculty'] = this.faculty;
    data['Status'] = this.status;
    data['phone-number'] = this.phoneNumber;
    data['id'] = this.id;
    return data;
  }
}