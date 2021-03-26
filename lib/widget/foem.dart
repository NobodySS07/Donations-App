class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String donations;
  String date;

  FeedbackForm(this.name, this.email, this.mobileNo,this.date, this.donations);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['email']}",
        "${json['mobileNo']}", "${json['date']}", "${json['Donation']}");
  }
  Map toJson() => {
    'name': name,
    'email': email,
    'mobileNo': mobileNo,
    'date':date,
    'donations': donations,
  };
}