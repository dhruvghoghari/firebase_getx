class Userdata {
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? gender;
  String? userId;

  Userdata(
      {this.firstname, this.lastname, this.email, this.mobile, this.gender , this.userId});

  Userdata.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    userId = json['userId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['userId'] = this.userId;

    return data;
  }
}