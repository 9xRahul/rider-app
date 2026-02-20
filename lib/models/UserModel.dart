class User {
  String? tokan;

  User({this.tokan});

  User.fromJson(Map<String, dynamic> json) {
    tokan = json['tokan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokan'] = this.tokan;
    return data;
  }
}
